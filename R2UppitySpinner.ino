//#define USE_DEBUG
#include "ReelTwo.h"
#include "core/SetupEvent.h"
#include "core/Enthropy.h"

///////////////////////////////////
// CONFIGURABLE OPTIONS
///////////////////////////////////

// If debug is enabled the serial baud rate will be 57600
#define SERIAL_BAUD_RATE                    2400
#define I2C_ADDRESS                         0x20
#define CONSOLE_BUFFER_SIZE                 300
#define COMMAND_BUFFER_SIZE                 256
#define ROTARY_THROTTLE_ACCELERATION_SCALE  100
#define ROTARY_THROTTLE_DECELERATION_SCALE  20
#define ROTARY_THROTTLE_LATENCY             25
#define ROTARY_FUDGE_POSITION               5

///////////////////////////////////
// RISKIER CONFIGURATION OPTIONS
///////////////////////////////////

#define LIFTER_MINIMUM_POWER        45      // 40 out of 100. Don't bother with lower values. Won't lift reliably
#define LIFTER_SEEKBOTTTOM_POWER    30      // 30 out of 100. Lower than LIFTER_MINIMUM_POWER because we are going down
#define ROTARY_MINIMUM_POWER        20      // 20 out of 100. Don't bother with lower values. Won't rotate reliably
#define LIFTER_DISTANCE             845     // default value - lifter will calibrate
#define ROTARY_MINIMUM_HEIGHT       LIFTER_DISTANCE/2
#define MOTOR_TIMEOUT               2000
#define OUTPUT_LIMIT_PRESCALE       3.1
#define DISTANCE_OUTPUT_SCALE       3
#define MAX_COMMANDS                100

#define EEPROM_MAGIC                0xba5eba11
#define EEPROM_CMD_MAGIC            0xf005ba11
#define EEPROM_END_TAG              0xff

// DO NOT ENABLE THIS UNLESS YOU REMOVE THE ROTARY UNIT
//#define DISABLE_SAFETY_MANEUVER

///////////////////////////////////
// --- Lifter mechanism

#define PIN_LIFTER_ENCODER_A   2
#define PIN_LIFTER_ENCODER_B   4

#define PIN_M1SF               A7
#define PIN_M2FB               A6

#define PIN_LIFTER_TOPLIMIT    23
#define PIN_LIFTER_BOTLIMIT    22

/* Lifter Motor */
#define PIN_MOTORS_EN          13   /* also BUILTIN_LED */
#define PIN_M1D2               7
#define PIN_M1PWM1             8
#define PIN_M1PWM2             9
#define PIN_M1FB               A0

///////////////////////////////////
// --- Rotary mechanism

#define PIN_ROTARY_ENCODER_A   3
#define PIN_ROTARY_ENCODER_B   5

#define PIN_ROTARY_LIMIT       6

/* Rotary Motor */
#define PIN_M2D2               10
#define PIN_M2PWM1             11
#define PIN_M2PWM2             12

//////////////////////////////
// LIGHT KIT TRI-STATE
//////////////////////////////
//   A    B    C
// OPEN OPEN OPEN  (Switch Position 0): Full Cycle (default): This routine will randomly select the LED
//                                      color, pattern, and speed for a random period of time.
// OPEN OPEN GND   (Switch Position 1): Off: This setting turns ALL lights OFF. I added this to allow a
//                                      microcontroller to turn off the lights without having to kill
//                                      the supply power.
// OPEN GND  OPEN  (Switch Position 2): Obi Wan: The Top LED’s flash Blue, the Side LED’s are Blue,
//                                      and the Main White LED’s are Random.
// OPEN GND  GND   (Switch Position 3): Yoda: The Top LED’s and Side LED’s fade Green On and Off.
// GND  OPEN OPEN  (Switch Position 4): Sith: The Top LED’s and Side LED’s flash Red.
// GND  OPEN GND   (Switch Position 5): Search Light: All LED’s are White, the Center Bright LED is ON.
// GND  GND  OPEN  (Switch Position 6): Dagobah: This is the most screen accurate mode.
//                                      The Main White LED’s are ON, the side LED’s are White, the Lower 
//                                      Rectangular Red LED’s are All On, and the Rear LED’s are Blinking Red.
// GND GND GND     (Switch Position 7): Sparkle: All White LED’s randomly Flash

#define PIN_LIGHTKIT_A         A1
#define PIN_LIGHTKIT_B         A2
#define PIN_LIGHTKIT_C         A3

///////////////////////////////////
// SDA A4
// SCL A5

#ifdef I2C_ADDRESS
#include <Wire.h>
#endif
#include <EEPROM.h>

///////////////////////////////////

#include "drive/TargetSteering.h"

///////////////////////////////////
#define ENCODER_STATUS_RATE 200 // ms (10Hz)

struct OutputLimit
{
    bool valid;
    unsigned outputLimit;
};

OutputLimit sUpLimits[100/5+1];
OutputLimit sDownLimits[100/5+1];
unsigned sMinimumPower;
unsigned sLifterDistance = LIFTER_DISTANCE;
bool sUpLimitsCalibrated;
bool sDownLimitsCalibrated;
bool sSafetyManeuver;
bool sCalibrating;
uint8_t sI2CAddress = I2C_ADDRESS;
uint32_t sBaudRate = SERIAL_BAUD_RATE;
unsigned sRotaryCircleEncoderCount;

static bool sNextCommand;
static bool sProcessing;
static unsigned sPos;
static uint32_t sWaitNextSerialCommand;
static char sBuffer[CONSOLE_BUFFER_SIZE];
static bool sCmdNextCommand;
static char sCmdBuffer[COMMAND_BUFFER_SIZE];

static void runSerialCommand()
{
    sWaitNextSerialCommand = 0;
    sProcessing = true;
}

static void resetSerialCommand()
{
    sWaitNextSerialCommand = 0;
    sNextCommand = false;
    sProcessing = (sCmdBuffer[0] == ':');
    sPos = 0;
}

///////////////////////////////////

class PeriscopeLifter : public SetupEvent
{
public:
    enum
    {
        kLightKit_FullCycle = 0,
        kLightKit_Off = 1,
        kLightKit_ObiWan = 2,
        kLightKit_Yoda = 3,
        kLightKit_Sith = 4,
        kLightKit_SearchLight = 5,
        kLightKit_Dagobah = 6,
        kLightKit_Sparkle = 7
    };

    ///////////////////////////////////
    // Read limit switches
    ///////////////////////////////////

    static bool lifterTopLimit()
    {
        bool limit = !digitalRead(PIN_LIFTER_TOPLIMIT);
        return limit;
    }

    static bool lifterBottomLimit()
    {
        bool limit = !digitalRead(PIN_LIFTER_BOTLIMIT);
        return limit;
    }

    static long getLifterPosition()
    {
        long pos;
        cli();
        pos = encoder_lifter_ticks;
        sei();
        return pos;
    }

    ///////////////////////////////////

    static bool rotaryHomeLimit()
    {
        bool limit = !digitalRead(PIN_ROTARY_LIMIT);
        return limit;
    }

    static long getRotaryPosition()
    {
        long pos;
        cli();
        pos = encoder_rotary_ticks;
        sei();
        return pos;
    }

    ///////////////////////////////////

    static bool lifterMotorFault()
    {
        return !digitalRead(PIN_M1SF);
    }

    static int lifterMotorCurrent()
    {
        // 5V / 10bit resolution / 0.525V/A = 0.0093006 A/count ~= 93 mA/count
        return analogRead(PIN_M1FB) * 93;
    }

    static int rotaryMotorCurrent()
    {
        // 5V / 10bit resolution / 0.525V/A = 0.0093006 A/count ~= 93 mA/count
        return analogRead(PIN_M2FB) * 93;
    }

    static bool isIdle()
    {
        if (lifterBottomLimit())
        {
            if (!fMotorsEnabled ||
                fMotorsEnabledTime + MOTOR_TIMEOUT < millis())
            {
                return true;
            }
        }
        return false;
    }

    ///////////////////////////////////

    static bool motorsEnabled()
    {
        return fMotorsEnabled;
    }

    static void disableMotors()
    {
        digitalWrite(PIN_MOTORS_EN, LOW);
        digitalWrite(PIN_M1D2, LOW);
        digitalWrite(PIN_M2D2, LOW);
        fMotorsEnabled = false;
    }

    static void enableMotors()
    {
        digitalWrite(PIN_MOTORS_EN, HIGH);
        fMotorsEnabled = true;
        fMotorsEnabledTime = millis();
    }

    ///////////////////////////////////
    // Move lifter motor up/down
    ///////////////////////////////////

    static void lifterMotorMove(float throttle)
    {
        bool reverse = (throttle < 0);
        throttle = min(max(abs(throttle), 0.0f), 1.0f);

        if (throttle < 0.10)
            throttle = 0;
        if (fLifterThrottle != throttle)
        {
            enableMotors();
            if (reverse)
            {
                analogWrite(PIN_M1PWM1, 255);
                analogWrite(PIN_M1PWM2, 255 - (255 * throttle));
                fLifterThrottle = -throttle;
            }
            else
            {
                analogWrite(PIN_M1PWM1, 0);
                analogWrite(PIN_M1PWM2, 255 * throttle);
                fLifterThrottle = throttle;
            }
            digitalWrite(PIN_M1D2, HIGH);
        }
    }

    static void lifterMotorStop()
    {
        enableMotors();
        analogWrite(PIN_M1PWM1, 0);
        analogWrite(PIN_M1PWM2, 0);
        digitalWrite(PIN_M1D2, HIGH);
        fLifterThrottle = 0;
    }

    static void lifterMotorOff()
    {
        digitalWrite(PIN_M1D2, LOW);
    }

    ///////////////////////////////////

    static bool serialAbort()
    {
        if (sCalibrating && Serial.available())
        {
            DEBUG_PRINTLN("SERIAL ABORT");
            while (Serial.available())
                Serial.read();
            sCalibrating = false;
            return true;
        }
        return false;
    }

    static bool seekToPosition(float pos, float speed)
    {
        if (!ensureSafetyManeuver())
            return false;

        // ensure position is in the range of 0.0 [bottom] - 1.0 [top]
        pos = min(max(abs(pos), 0.0f), 1.0f);
        if (isRotarySpinning() || !rotaryHomeLimit())
        {
            // Cannot go below 50% if spinning or not at home position
            pos = min(max(pos, 0.5f), 1.0f);
        }
        if (speed * 100 < sMinimumPower)
            return seekToPositionSlow(pos, speed/(sMinimumPower/100.0));

        long maxlen = sLifterDistance;
        long current = getLifterPosition();
        long target_ticks = pos * maxlen;

        long distance = abs(target_ticks - current);
        TargetSteering steering(target_ticks);
        steering.setSampleTime(1);
        float minpower = (1.0f - ((float)distance / (float)maxlen)) + 0.1;
        steering.setDistanceTunings(1.0, minpower, minpower);

        float limit;
        bool success = false;
        if (target_ticks > getLifterPosition())
        {
            // seek up
            if (!getUpOutputLimit(speed, limit))
                return false;
            steering.setDistanceOutputLimits(min(distance * DISTANCE_OUTPUT_SCALE, limit));
            bool topLimit;
            LifterStatus lifterStatus;
            for (;;)
            {
                long encoder_ticks = getLifterPosition();
                topLimit = lifterTopLimit();
                if (topLimit || encoder_ticks == target_ticks || serialAbort())
                    break;
                steering.setCurrentDistance(encoder_ticks);
                lifterMotorMove(steering.getThrottle() * speed);

                if (!lifterStatus.isMoving())
                {
                    DEBUG_PRINTLN(F("ABORT"));
                    break;
                }
            }
            success = topLimit;
        }
        else
        {
            // seek down
            if (!getDownOutputLimit(speed, limit))
                return false;
            steering.setDistanceOutputLimits(min(distance * DISTANCE_OUTPUT_SCALE, limit));
            bool botLimit;
            LifterStatus lifterStatus;
            for (;;)
            {
                long encoder_ticks = getLifterPosition();
                botLimit = lifterBottomLimit();
                if (botLimit || encoder_ticks == target_ticks || serialAbort())
                    break;
                steering.setCurrentDistance(encoder_ticks);
                lifterMotorMove(steering.getThrottle() * speed);

                if (!lifterStatus.isMoving())
                {
                    DEBUG_PRINTLN(F("ABORT"));
                    break;
                }
            }
            success = botLimit;
        }
        lifterMotorStop();
        return success;
    }

    ///////////////////////////////////
    // Spin rotary motor left/right
    ///////////////////////////////////

    static bool rotaryAllowed()
    {
        return (getLifterPosition() > ROTARY_MINIMUM_HEIGHT);
    }

    static void rotaryMotorSpeed(float speed)
    {
        fRotarySpeed = (rotaryAllowed()) ? speed : 0;
        fRotaryEncoderLastStatus = millis();
        rotaryMotorUpdate();
    }

    static void rotaryMotorUpdate()
    {
        uint32_t currentMillis = millis();
        if (currentMillis - fRotaryThrottleUpdate > ROTARY_THROTTLE_LATENCY)
        {
            if (rotaryAllowed() && (fRotarySpeed != 0 || fRotaryThrottle != 0))
            {
                float throttle = 0;
                long encoder_ticks = getRotaryPosition();
                if (fRotarySpeed > fRotaryThrottle)
                {
                    float scale = ROTARY_THROTTLE_ACCELERATION_SCALE;
                    if (fRotaryThrottle < 0)
                        scale = ROTARY_THROTTLE_DECELERATION_SCALE;
                    float val = max(abs(fRotarySpeed - fRotaryThrottle) / scale, 0.01f);
                    throttle = ((int)round(min(fRotaryThrottle + val, fRotarySpeed)*100))/100.0f;
                    DEBUG_PRINTLN(throttle);
                    rotaryMotorMove(throttle);
                    fRotaryThrottle = throttle;
                }
                else if (fRotarySpeed < fRotaryThrottle)
                {
                    float scale = ROTARY_THROTTLE_ACCELERATION_SCALE;
                    if (fRotaryThrottle > 0)
                        scale = ROTARY_THROTTLE_DECELERATION_SCALE;
                    float val = abs(fRotarySpeed - fRotaryThrottle) / scale;
                    throttle = ((int)floor(max(fRotaryThrottle - val, fRotarySpeed)*100))/100.0f;
                    DEBUG_PRINTLN(throttle);
                    rotaryMotorMove(throttle);
                    fRotaryThrottle = throttle;
                }
                if (millis() - fRotaryEncoderLastStatus > ENCODER_STATUS_RATE*2)
                {
                    fRotaryEncoderLastStatus = millis();
                    if (fRotaryEncoderLastTick == encoder_ticks)
                    {
                        DEBUG_PRINTLN(F("ROTARY NOT MOVING - ABORT"));
                        rotaryMotorStop();
                    }
                    fRotaryEncoderLastTick = encoder_ticks;
                }
                fRotaryThrottleUpdate = currentMillis;
            }
        }
    }

    static void rotaryMotorMove(float throttle)
    {
        bool reverse = (throttle < 0);
        throttle = min(max(abs(throttle), 0.0f), 1.0f);
        if (throttle < 0.10)
            throttle = 0;

        // Ensure lifter is higher than minimum
        if (rotaryAllowed())
        {
            if (fRotaryThrottle != throttle)
            {
                fRotaryEncoderLastStatus = millis();
                fRotaryEncoderLastTick = getRotaryPosition();
                fRotaryMoving = (throttle != 0);
                enableMotors();
                if (reverse)
                {
                    analogWrite(PIN_M2PWM1, 255 - (255 * throttle));
                    analogWrite(PIN_M2PWM2, 255);
                    fRotaryThrottle = -throttle;
                }
                else
                {
                    analogWrite(PIN_M2PWM1, 255 * throttle);
                    analogWrite(PIN_M2PWM2, 0);
                    fRotaryThrottle = throttle;
                }
                digitalWrite(PIN_M2D2, HIGH);
            }
        }
        else
        {
            DEBUG_PRINT(F("ROTARY NOT ALLOWED: "));
            DEBUG_PRINTLN(getLifterPosition());
        }
    }

    static bool withinArc(double p1, double p2, double p3)
    {
        return fmod(p2 - p1 + 2*360, 360) >= fmod(p3 - p1 + 2*360, 360);
    }

    static int normalize(int degrees)
    {
        degrees = fmod(degrees, 360);
        if (degrees < 0)
            degrees += 360;
        return degrees;
    }

    static int shortestDistance(int origin, int target)
    {
        int result = 0.0;
        int diff = fmod(fmod(abs(origin - target), 360), 360);

        if (diff > 180)
        {
            //There is a shorter path in opposite direction
            result = (360 - diff);
            if (target > origin)
                result *= -1;
        }
        else
        {
            result = diff;
            if (origin > target)
                result *= -1;
        }
        return result;
    }

    static bool moveScopeToTarget(int pos, int target, int fudge, float speed, float maxspeed, float &m)
    {
        DEBUG_PRINT(F("MOVE raw=")); DEBUG_PRINT(getRotaryPosition());
        DEBUG_PRINT(F(" pos=")); DEBUG_PRINT(pos);
        DEBUG_PRINT(F(" target=")); DEBUG_PRINT(target);
        if (!withinArc(target - fudge, target + fudge, pos))
        {
            int dist = shortestDistance(pos, target);
            DEBUG_PRINT(F(" dist=")); DEBUG_PRINT(dist);
            if (maxspeed > speed && abs(dist) > fudge*2)
                speed += (maxspeed - speed) * float(abs(dist)) / 180;
            DEBUG_PRINT(F(" speed1=")); DEBUG_PRINT(speed);
            if (speed < (ROTARY_MINIMUM_POWER/100.0))
                speed = (ROTARY_MINIMUM_POWER/100.0);
            DEBUG_PRINT(F(" speed2=")); DEBUG_PRINT(speed);
            float nm = (dist > 0) ? -speed : speed;
            if (m != 0 && ((m < 0 && nm > 0) || (m > 0 && nm < 0)))
            {
                // Safety check: In case of problems with the rotary encoder. If our
                // direction changes from the initial direction we will just stop.
                DEBUG_PRINTLN(F("DIRECTION CHANGE"));
                DEBUG_PRINTLN(m);
                DEBUG_PRINTLN(nm);
                return true;
            }
            m = nm;
            DEBUG_PRINT(F(" m=")); DEBUG_PRINTLN(m);
            return false;
        }
        DEBUG_PRINTLN();
        return true;
    }

    static unsigned rotaryMotorCurrentPosition()
    {
        return normalize(getRotaryPosition() * (360.0 / sRotaryCircleEncoderCount));
    }

    static void rotaryMotorAbsolutePosition(int degrees, float speed = 0, float maxspeed = 0)
    {
        float m = 0;
        if (speed == 0)
            speed = (ROTARY_MINIMUM_POWER/100.0);
        if (maxspeed == 0)
            maxspeed = speed;
        Serial.print(F("ROTATE "));
        Serial.print(degrees);
        Serial.print(F(" Speed: "));
        Serial.print(speed);
        Serial.print(F(" Max: "));
        Serial.println(maxspeed);
        // degrees = -degrees;
        RotaryStatus rotaryStatus;
        while (!moveScopeToTarget(rotaryMotorCurrentPosition(), normalize(degrees), ROTARY_FUDGE_POSITION, speed, maxspeed, m))
        {
            rotaryMotorMove(m);
            if (!rotaryStatus.isMoving())
            {
                DEBUG_PRINTLN(F("ABORT"));
                break;
            }
        }
        rotaryMotorStop();
    }

    static void rotaryMotorRelativePosition(int relativeDegrees)
    {
        long rotaryStartPos = getRotaryPosition();
        relativeDegrees = normalize(relativeDegrees);
        rotaryMotorMove((relativeDegrees > 0) ? (ROTARY_MINIMUM_POWER/100.0) : -(ROTARY_MINIMUM_POWER/100.0));
        RotaryStatus rotaryStatus;
        for (;;)
        {
            long encoder_ticks = getRotaryPosition();
            int diff = abs(rotaryStartPos - encoder_ticks);
            if (diff >= abs(relativeDegrees) * (sRotaryCircleEncoderCount / 360.0))
                break;
            if (!rotaryStatus.isMoving())
            {
                DEBUG_PRINTLN(F("ABORT"));
                break;
            }
        }
        rotaryMotorStop();
    }

    static void rotateHome()
    {
        if (shortestDistance(rotaryMotorCurrentPosition(), 0) > 0)
        {
            rotateLeftHome();
        }
        else
        {
            rotateRightHome();
        }
    }

    static void rotateUntilHome(float speed)
    {
        bool neg = (speed < 0);
        speed = (ROTARY_MINIMUM_POWER/100.0) + 0.1 * abs(speed);
        if (neg)
            speed = -speed;
        DEBUG_PRINTLN(speed);
        RotaryStatus rotaryStatus;
        encoder_rotary_stop_limit = true;
        while (!rotaryHomeLimit())
        {
            rotaryMotorMove(speed);
            delay(2);
            rotaryMotorStop();
            delay(1);
            if (!rotaryStatus.isMoving())
            {
                DEBUG_PRINTLN(F("ABORT"));
                break;
            }
        }
        rotaryMotorStop();
        encoder_rotary_stop_limit = false;
    }

    static void rotateLeftHome()
    {
        // Ensure lifter is higher than minimum
        if (rotaryAllowed())
        {
            if (!rotaryHomeLimit())
            {
                rotateUntilHome(-0.1);
            }
            delay(200);
            if (!rotaryHomeLimit())
            {
                rotateUntilHome(0.1);
            }
            if (rotaryHomeLimit())
            {
                // DEBUG_PRINTLN("FOUND HOME");
                resetRotaryPosition();
            }
        }
    }

    static void rotateRightHome()
    {
        // Ensure lifter is higher than minimum
        if (rotaryAllowed())
        {
            if (!rotaryHomeLimit())
            {
                rotateUntilHome(0.1);
            }
            delay(200);
            if (!rotaryHomeLimit())
            {
                rotateUntilHome(-0.1);
            }
            if (!rotaryHomeLimit())
            {
                rotateUntilHome(-0.1);
            }
            if (rotaryHomeLimit())
            {
                DEBUG_PRINTLN(F("FOUND HOME"));
                resetRotaryPosition();
            }
            else
            {
                DEBUG_PRINTLN(F("NOT AT HOME"));
            }
        }
    }

    static void rotaryMotorStop()
    {
        fRotarySpeed = 0;
        enableMotors();
        analogWrite(PIN_M2PWM1, 0);
        analogWrite(PIN_M2PWM2, 0);
        digitalWrite(PIN_M2D2, HIGH);
        fRotaryThrottle = 0;
        fRotaryMoving = false;
    }

    static void rotaryMotorOff()
    {
        digitalWrite(PIN_M2D2, LOW);
    }

    static bool isRotarySpinning()
    {
        return fRotaryMoving;
    }

    static bool isRotaryAtRest()
    {
        return ((rotaryHomeLimit() || rotaryMotorCurrentPosition() == 0) && !fRotaryMoving);
    }

    ///////////////////////////////////

    ///////////////////////////////////
    // Select show 0-7
    ///////////////////////////////////
    // 0: Full Cycle (default): This routine will randomly select the LED
    //    color, pattern, and speed for a random period of time.
    //
    // 1: Off: This setting turns ALL lights OFF. I added this to allow a
    //    microcontroller to turn off the lights without having to kill
    //    the supply power.
    //
    // 2: Obi Wan: The Top LED’s flash Blue, the Side LED’s are Blue,
    //    and the Main White LED’s are Random.
    //
    // 3: Yoda: The Top LED’s and Side LED’s fade Green On and Off.
    //
    // 4: Sith: The Top LED’s and Side LED’s flash Red.
    //
    // 5: Search Light: All LED’s are White, the Center Bright LED is ON.
    //
    // 6: Dagobah: This is the most screen accurate mode.
    //    The Main White LED’s are ON, the side LED’s are White, the Lower 
    //    Rectangular Red LED’s are All On, and the Rear LED’s are Blinking Red.
    //
    // 7: Sparkle: All White LED’s randomly Flash
    //
    static void setLightShow(unsigned show)
    {
        digitalWrite(PIN_LIGHTKIT_A, !((show>>2)&1));
        digitalWrite(PIN_LIGHTKIT_B, !((show>>1)&1));
        digitalWrite(PIN_LIGHTKIT_C, !((show>>0)&1));
    }

    virtual void setup() override
    {
        //////////////////////////
        // LIMIT SWITCH PINS
        //////////////////////////

        pinMode(PIN_LIFTER_TOPLIMIT, INPUT_PULLUP);
        pinMode(PIN_LIFTER_BOTLIMIT, INPUT_PULLUP);
        pinMode(PIN_ROTARY_LIMIT, INPUT_PULLUP);

        //////////////////////////
        // ENCODER PINS
        //////////////////////////

        pinMode(PIN_LIFTER_ENCODER_A, INPUT);
        pinMode(PIN_LIFTER_ENCODER_B, INPUT);

        pinMode(PIN_ROTARY_ENCODER_A, INPUT);
        pinMode(PIN_ROTARY_ENCODER_B, INPUT);

        attachInterrupt(
            digitalPinToInterrupt(PIN_LIFTER_ENCODER_A),
                measureLifterEncoder, CHANGE);
        attachInterrupt(
            digitalPinToInterrupt(PIN_ROTARY_ENCODER_A),
                measureRotaryEncoder, CHANGE);

        //////////////////////////
        // MOTOR DRIVER PINS
        //////////////////////////

        // ENABLE DRIVER
        pinMode(PIN_MOTORS_EN, OUTPUT);

        // LIFTER
        pinMode(PIN_M1D2, OUTPUT);
        pinMode(PIN_M1PWM1, OUTPUT);
        pinMode(PIN_M1PWM2, OUTPUT);
        digitalWrite(PIN_M1D2, LOW);

        // ROTARY
        pinMode(PIN_M2D2, OUTPUT);
        pinMode(PIN_M2PWM1, OUTPUT);
        pinMode(PIN_M2PWM2, OUTPUT);
        digitalWrite(PIN_M2D2, LOW);

        // FEEDBACK ONLY FOR LIFTER
        pinMode(PIN_M1FB, INPUT);
        pinMode(PIN_M2FB, INPUT);
        pinMode(PIN_M1SF, INPUT_PULLUP);

        //////////////////////////
        // LIGHT KIT PINS
        //////////////////////////

        pinMode(PIN_LIGHTKIT_A, OUTPUT);
        pinMode(PIN_LIGHTKIT_B, OUTPUT);
        pinMode(PIN_LIGHTKIT_C, OUTPUT);

        //////////////////////////

        setLightShow(kLightKit_Off);

        //////////////////////////

        if (readSettingsFromEEPROM())
        {
            Serial.println(F("Read saved calibration"));
        }
        Serial.println(F("Generating random"));
        randomSeed(Enthropy::generate());
    }

    ///////////////////////////////////

    static bool isCalibrated()
    {
        return sUpLimitsCalibrated && sDownLimitsCalibrated;
    }

    static void seekToBottom(bool usePID = true)
    {
        if (!isRotaryAtRest())
        {
            DEBUG_PRINTLN(F("ABORT: ROTARY NOT HOME"));
            DEBUG_PRINTLN(rotaryMotorCurrentPosition());
            return;
        }
        if (!usePID)
        {
            DEBUG_PRINTLN(F("SEEK TO BOTTOM"));

            // seek down
            float mpower = LIFTER_SEEKBOTTTOM_POWER / 100.0;
            bool botLimit;
            LifterStatus lifterStatus;
            for (;;)
            {
                botLimit = lifterBottomLimit();
                if (botLimit || serialAbort())
                    break;
                lifterMotorMove(-mpower);

                if (!lifterStatus.isMoving())
                {
                    DEBUG_PRINTLN(F("ABORT"));
                    break;
                }
            }
            lifterMotorStop();
            delay(500);
            if (botLimit)
            {
                DEBUG_PRINTLN(F("BOTTOM LIMIT REACHED"));
                if (sLifterDistance == 0)
                {
                    sLifterDistance = abs(getLifterPosition()) + 10;
                    DEBUG_PRINT(F("LIFTER DISTANCE: "));
                    DEBUG_PRINTLN(sLifterDistance);
                }
                resetLifterPosition();
            }
        }
        else
        {
            float fDIn = 0;
            float fDOut = 0;
            float fDSet = 0;
            PID<float> distance(fDIn, fDOut, fDSet, 1.0, 0.01, 0.01);
            // TargetSteering steering(0);
            distance.setAutomatic(true);
            distance.setSampleTime(1);
            distance.setOutputLimits(-350, 350);

            DEBUG_PRINTLN(F("SEEK TO BOTTOM PID"));
        #ifdef USE_DEBUG
            uint32_t start = millis();
        #endif
            bool botLimit;
            LifterStatus lifterStatus;
            for (;;)
            {
                long encoder_ticks = getLifterPosition();
                botLimit = lifterBottomLimit();
                if (botLimit || serialAbort())
                    break;
                fDSet = encoder_ticks;
                distance.process();
                float throttle = (fDOut / 350.0);
                if (throttle > 1.0)
                    break;
                lifterMotorMove(-throttle * 0.7);

                if (!lifterStatus.isMoving())
                {
                    DEBUG_PRINT(F("LIFTER ABORTED AT ")); DEBUG_PRINTLN(encoder_ticks);
                    break;
                }
            }
            lifterMotorStop();
        #ifdef USE_DEBUG
            uint32_t stop = millis();
        #endif
            if (botLimit)
            {
                DEBUG_PRINTLN(F("BOTTOM LIMIT REACHED"));
                DEBUG_PRINT(F("DISTANCE: "));
                DEBUG_PRINTLN(getLifterPosition());
                DEBUG_PRINT(F("TIME: "));
                DEBUG_PRINTLN(stop - start);
                // resetLifterPosition();
            }
        }
    }

    static bool safetyManeuver()
    {
        // On startup we'll first seek to the top and make sure
        // that the rotary is in home position. Then seek back down.
        // This should safely clear any state the scope was in.
        Serial.println("SAFETY");
        if (seekToTop(0.8, false))
        {
        #ifndef DISABLE_SAFETY_MANEUVER
            setLightShow(kLightKit_Dagobah);

            int attempt = 0;
            while (sRotaryCircleEncoderCount == 0 && attempt++ < 5)
            {
                // Ensure rotary in home position
                rotaryMotorMove(-(ROTARY_MINIMUM_POWER/100.0));
                delay(200);

                rotateLeftHome();
                delay(100);

                if (!rotaryHomeLimit())
                {
                    Serial.println("NOT HOME TRY SPIN AROUND");
                    bool rotaryWasHome = true;
                    RotaryStatus rotaryStatus;
                    rotaryMotorMove(-(ROTARY_MINIMUM_POWER/100.0));
                    for (;;)
                    {
                        if (rotaryHomeLimit())
                        {
                            // DEBUG_PRINTLN("ROTARY HOME");
                            if (!rotaryWasHome)
                            {
                                // DEBUG_PRINTLN("ROTARY FINAL HOME");
                                break;
                            }
                        }
                        else if (rotaryWasHome)
                        {
                            // DEBUG_PRINTLN("ROTARY NO LONGER HOME");
                            rotaryWasHome = false;
                        }
                        if (!rotaryStatus.isMoving())
                        {
                            break;
                        }
                    }
                    rotaryMotorStop();
                }
                if (rotaryHomeLimit())
                {
                    Serial.println("FIND ENCODER LENGTH");
                    resetRotaryPosition();
                    encoder_rotary_last_status = millis();
                    bool rotaryWasHome = true;
                    rotaryMotorMove(-(ROTARY_MINIMUM_POWER/100.0));
                    delay(100);
                    RotaryStatus rotaryStatus;
                    encoder_rotary_stop_limit = true;
                    for (;;)
                    {
                        if (rotaryHomeLimit())
                        {
                            // DEBUG_PRINTLN("ROTARY HOME");
                            if (!rotaryWasHome)
                            {
                                // DEBUG_PRINTLN("ROTARY FINAL HOME");
                                break;
                            }
                        }
                        else if (rotaryWasHome)
                        {
                            // DEBUG_PRINTLN("ROTARY NO LONGER HOME");
                            rotaryWasHome = false;
                        }
                    #ifdef USE_DEBUG
                        long encoder_ticks = getRotaryPosition();
                    #endif
                        if (!rotaryStatus.isMoving())
                        {
                            break;
                        }
                    }
                    encoder_rotary_stop_limit = false;
                    rotaryMotorStop();
                    delay(100);
                    sRotaryCircleEncoderCount = abs(getRotaryPosition());
                    Serial.print("ROTARY ENCODER COUNT = ");
                    Serial.println(sRotaryCircleEncoderCount);
                    if (sRotaryCircleEncoderCount < 1000)
                    {
                        // BAD try again
                        sRotaryCircleEncoderCount = 0;
                    }
                }
                else
                {
                    DEBUG_PRINTLN(F("ROTARY NOT HOME TRY AGAIN"));
                }
            }
            // Scope position won't work
            if (!sRotaryCircleEncoderCount)
            {
                return false;
            }

            setLightShow(kLightKit_Off);
            if (!isRotaryAtRest())
            {
                Serial.println(F("ABORT: ROTARY NOT HOME"));
                Serial.println(rotaryMotorCurrentPosition());
                return false;
            }
        #endif
            // Reset sLifterDistance length
            sLifterDistance = 0;
            resetLifterPosition();
            seekToBottom(false);
            sSafetyManeuver = lifterBottomLimit();
            return sSafetyManeuver;
        }
        else
        {
            DEBUG_PRINTLN(F("ABORT: FAILED SEEK TO TOP"));
            return false;
        }
        return true;
    }

    static bool ensureSafetyManeuver()
    {
        if (!sSafetyManeuver)
        {
            if (!safetyManeuver())
                disableMotors();
        }
        return sSafetyManeuver;
    }

    static bool calibrate()
    {
        bool success = true;
        sCalibrating = true;
        sMinimumPower = max(sMinimumPower, LIFTER_MINIMUM_POWER);
        if (!safetyManeuver())
        {
            Serial.println(F("ABORT: FAILED SAFETY MANEUVER"));
            sCalibrating = false;
            return false;
        }
    retry:
        if (!isRotaryAtRest())
        {
            if (!safetyManeuver())
            {
                Serial.println(F("ABORT: FAILED SAFETY MANEUVER"));
                sCalibrating = false;
                return false;
            }
        }
        // Clear all limits
        memset(sUpLimits, '\0', sizeof(sUpLimits));
        memset(sDownLimits, '\0', sizeof(sDownLimits));
        sUpLimitsCalibrated = false;
        sDownLimitsCalibrated = false;
        sMinimumPower = 0;

        long homePosition = getLifterPosition();
        Serial.println(F("CALIBRATE MINIMUM POWER"));
        Serial.println(homePosition);
        int topSpeed = LIFTER_MINIMUM_POWER;
        for (topSpeed = LIFTER_MINIMUM_POWER; topSpeed <= 100; topSpeed += 5)
        {
            LifterStatus lifterStatus;
            lifterMotorMove(topSpeed / 100.0);
            delay(ENCODER_STATUS_RATE*2);
            lifterMotorStop();
            if (lifterStatus.isMoving())
                break;
        }
        seekToBottom(false);

        long targetDistance = sLifterDistance;

        Serial.println(F("CALIBRATE TO TOP"));
        Serial.print(F("MINIMUM POWER: ")); Serial.println(topSpeed);
        for (; sCalibrating && topSpeed <= 100; topSpeed += 5)
        {
            unsigned tries = 0;
            if (!isRotaryAtRest())
            {
                DEBUG_PRINTLN(F("ABORT: ROTARY NOT AT HOME POSITION"));
                DEBUG_PRINTLN(rotaryMotorCurrentPosition());
                goto retry;
            }
            long outputLimit = max(topSpeed * OUTPUT_LIMIT_PRESCALE, 10);
            Serial.print(F("SPEED: ")); Serial.println(topSpeed);
            while (outputLimit >= 0)
            {
                tries++;
                long maxEncoderVal = 0;
                seekToBottom(false);
                delay(1000);

                TargetSteering steering(targetDistance);
                steering.setDistanceOutputLimits(outputLimit);
                steering.setSampleTime(1);
            #ifdef USE_DEBUG
                uint32_t start = millis();
            #endif
                bool topLimit;
                long start_ticks = getLifterPosition();
                DEBUG_PRINT(F("OUTPUT LIMIT: ")); DEBUG_PRINTLN(outputLimit);
                LifterStatus lifterStatus;
                for (;;)
                {
                    long encoder_ticks = getLifterPosition();
                    maxEncoderVal = max(maxEncoderVal, encoder_ticks);
                    topLimit = lifterTopLimit();
                    if (topLimit || serialAbort())
                        break;

                    steering.setCurrentDistance(encoder_ticks);
                    float throttle = 1.0;
                    if (outputLimit > 0)
                        throttle = steering.getThrottle();
                    lifterMotorMove(throttle * (topSpeed / 100.0));

                    if (!lifterStatus.isMoving())
                    {
                        Serial.println(F("ABORT"));
                        break;
                    }
                }
                lifterMotorStop();
                if (start_ticks == getLifterPosition())
                {
                    DEBUG_PRINTLN(F(" SPEED TOO LOW"));
                    break;
                }
            #ifdef USE_DEBUG
                uint32_t stop = millis();
            #endif
                if (topLimit)
                {
                #if 0//def USE_DEBUG
                    DEBUG_PRINT(F("TOP LIMIT REACHED - "));
                    DEBUG_PRINT(topSpeed);
                    DEBUG_PRINT(F(" "));
                    DEBUG_PRINTLN(outputLimit);

                    long encoder_ticks = getLifterPosition();
                    DEBUG_PRINT(F("  DISTANCE: "));
                    DEBUG_PRINT(encoder_ticks);
                    DEBUG_PRINT(F(" MAX DISTANCE: "));
                    DEBUG_PRINTLN(maxEncoderVal);
                    DEBUG_PRINT(F("TIME: "));
                    DEBUG_PRINT(stop - start);
                    DEBUG_PRINTLN();
                #endif
                    size_t index = topSpeed/5;
                    sUpLimits[index].valid = true;
                    sUpLimits[index].outputLimit = outputLimit;
                    if (sMinimumPower == 0)
                        sMinimumPower = topSpeed;
                    break;
                }
                else
                {
                    long encoder_ticks = getLifterPosition();
                    if (outputLimit == 0)
                    {
                        DEBUG_PRINTLN(F(" LIMIT NOT REACHED - GIVING UP"));
                        break;
                    }
                    DEBUG_PRINT(encoder_ticks);
                    DEBUG_PRINT(F(" LIMIT NOT REACHED - RETRYING "));
                    DEBUG_PRINT(targetDistance - encoder_ticks);
                    outputLimit -= max((targetDistance - encoder_ticks)*2, 10);
                    if (outputLimit < 0)
                        outputLimit = 0;
                    DEBUG_PRINT(F(" NEW LIMIT : ")); DEBUG_PRINTLN(outputLimit);
                }
                delay(1000);
                if (serialAbort())
                    break;
            }
            if (!sCalibrating || serialAbort())
            {
                Serial.println(F("SERIAL ABORT"));
                success = false;
                break;
            }
        }
        // Abort calibration
        if (!success)
        {
            Serial.println(F("CALIBRATION ABORTED"));
            sCalibrating = false;
            return false;
        }

        sUpLimitsCalibrated = true;
        Serial.println(F("CALIBRATE TO BOTTOM"));
        DEBUG_PRINT(F("TOP LIMIT SWITCH: "));
        DEBUG_PRINTLN(lifterTopLimit());
        DEBUG_PRINT(F("BOTTOM LIMIT SWITCH: "));
        DEBUG_PRINTLN(lifterBottomLimit());
        seekToBottom(false);
        delay(2000);

        for (topSpeed = sMinimumPower; sCalibrating && topSpeed <= 100; topSpeed += 5)
        {
            float limit;
            if (!getUpOutputLimit(topSpeed/100.0f, limit))
                continue;
            long outputLimit = max(limit*2, 160);
            while (success && outputLimit > 0)
            {
                long minEncoderVal = 0x7FFFFFFFL;
                if (!seekToTop(0.8))
                {
                    Serial.println(F("SEEK TO TOP FAILED - ABORT"));
                    topSpeed = 200;
                    success = false;
                    break;
                }

                TargetSteering steering(homePosition);
                steering.setDistanceOutputLimits(outputLimit);
                steering.setSampleTime(1);
            #ifdef USE_DEBUG
                uint32_t start = millis();
            #endif
                bool botLimit;
                long start_ticks = getLifterPosition();
                LifterStatus lifterStatus;
                for (;;)
                {
                    long encoder_ticks = getLifterPosition();
                    minEncoderVal = min(minEncoderVal, encoder_ticks);
                    botLimit = lifterBottomLimit();
                    if (botLimit || serialAbort())
                        break;
                    steering.setCurrentDistance(encoder_ticks);
                    lifterMotorMove(steering.getThrottle() * (topSpeed / 100.0));

                    if (!lifterStatus.isMoving())
                    {
                        Serial.println(F("ABORT"));
                        break;
                    }
                }
                lifterMotorStop();
                if (start_ticks == getLifterPosition())
                {
                    DEBUG_PRINTLN(F(" SPEED TOO LOW"));
                    success = false;
                    break;
                }
            #ifdef USE_DEBUG
                uint32_t stop = millis();
            #endif
                if (botLimit)
                {
                    // DEBUG_PRINT(F("BOT LIMIT REACHED - "));
                    // DEBUG_PRINT(topSpeed);
                    // DEBUG_PRINT(F(" "));
                    // DEBUG_PRINTLN(outputLimit);

                    // long encoder_ticks = getLifterPosition();
                    // DEBUG_PRINT(F("  DISTANCE: "));
                    // DEBUG_PRINT(encoder_ticks);
                    // DEBUG_PRINT(F(" MAX DISTANCE: "));
                    // DEBUG_PRINTLN(minEncoderVal);
                    // DEBUG_PRINT(F("TIME: "));
                    // DEBUG_PRINT(stop - start);
                    // if (encoder_ticks > minEncoderVal)
                    // {
                    //     DEBUG_PRINT(F(" BOUNCE: "));
                    //     DEBUG_PRINT(encoder_ticks - minEncoderVal);
                    // }
                    // DEBUG_PRINTLN();
                    size_t index = topSpeed/5;
                    // DEBUG_PRINT(F("index: ")); DEBUG_PRINTLN(index);
                    sDownLimits[index].valid = true;
                    sDownLimits[index].outputLimit = outputLimit;
                    break;
                }
                else
                {
                    long encoder_ticks = getLifterPosition();
                    // DEBUG_PRINT(encoder_ticks);
                    // DEBUG_PRINT(F(" LIMIT NOT REACHED - RETRYING "));
                    // DEBUG_PRINT(targetDistance - encoder_ticks);
                    outputLimit -= max(targetDistance - encoder_ticks, 1);
                    if (outputLimit < 0)
                        outputLimit = 0;
                    // DEBUG_PRINT(F(" NEW LIMIT : ")); DEBUG_PRINTLN(outputLimit);
                }
                delay(2000);
                if (serialAbort())
                    break;
            }
            if (!sCalibrating || serialAbort())
            {
                Serial.println(F("SERIAL ABORT"));
                success = false;
                break;
            }
        }
        seekToBottom();
        if (!success)
        {
            Serial.println(F("CALIBRATION ABORTED"));
            sMinimumPower = max(sMinimumPower, LIFTER_MINIMUM_POWER);
            sCalibrating = false;
            return false;
        }

        sDownLimitsCalibrated = true;
        writeSettingsToEEPROM();
        Serial.println(F("SUCCESS"));
        sCalibrating = false;
        return true;
    }

private:
    ///////////////////////////////////
    // Read motor encoders
    ///////////////////////////////////

    static void measureLifterEncoder()
    {
        encoder_lifter_val = digitalRead(PIN_LIFTER_ENCODER_A);
        if (encoder_lifter_pin_A_last == LOW && encoder_lifter_val == HIGH)
        {
            if (digitalRead(PIN_LIFTER_ENCODER_B) == LOW)
            {
                encoder_lifter_ticks++;
            }
            else
            {
                encoder_lifter_ticks--;
            }
            encoder_lifter_changed++;
        }
        encoder_lifter_pin_A_last = encoder_lifter_val;
    }

    static void measureRotaryEncoder()
    {
        encoder_rotary_val = digitalRead(PIN_ROTARY_ENCODER_A);
        if (encoder_rotary_pin_A_last == LOW && encoder_rotary_val == HIGH)
        {
            if (digitalRead(PIN_ROTARY_ENCODER_B) == LOW)
            {
                encoder_rotary_ticks++;
            }
            else
            {
                encoder_rotary_ticks--;
            }
            encoder_rotary_changed++;
            if (encoder_rotary_stop_limit && rotaryHomeLimit())
            {
                encoder_rotary_stop_ticks = encoder_rotary_ticks;
                // Stop rotary motor if limit switch was hit
                analogWrite(PIN_M2PWM1, 0);
                analogWrite(PIN_M2PWM2, 0);
                digitalWrite(PIN_M2D2, HIGH);
            }
        }
        encoder_rotary_pin_A_last = encoder_rotary_val;
    }

    ///////////////////////////////////

    static void resetLifterChangedState()
    {
        cli();
        encoder_lifter_changed = 0;
        sei();
    }

    static void resetRotaryChangedState()
    {
        cli();
        encoder_rotary_changed = 0;
        sei();
    }

    static void resetLifterPosition()
    {
        cli();
        encoder_lifter_val = 0;
        encoder_lifter_pin_A_last = 0;
        encoder_lifter_ticks = 0;    
        sei();
    }

    static void resetLifterPositionTop()
    {
        cli();
        encoder_lifter_val = 0;
        encoder_lifter_pin_A_last = 0;
        encoder_lifter_ticks = sLifterDistance;    
        sei();
    }

    static void resetRotaryPosition()
    {
        cli();
        encoder_rotary_val = 0;
        encoder_rotary_pin_A_last = 0;
        encoder_rotary_ticks = 0;    
        sei();
    }

    ///////////////////////////////////

    static bool getDownOutputLimit(float speed, float &limit)
    {
        speed = min(max(speed, 0.0f), 1.0f);
        size_t index = size_t(speed*100/5);
        limit = 0;
        if (index < sizeof(sDownLimits)/sizeof(sDownLimits[0]) && sDownLimits[index].valid)
        {
            limit = sDownLimits[index].outputLimit;
            return true;
        }
        DEBUG_PRINT(F("UNCALIBRATED SPEED - "));
        DEBUG_PRINT(speed);
        DEBUG_PRINT(F(" - "));
        DEBUG_PRINTLN(index);
        return false;
    }

    static bool getUpOutputLimit(float speed, float &limit)
    {
        speed = min(max(speed, 0.0f), 1.0f);
        size_t index = size_t(speed*100/5);
        limit = 0;
        if (index < sizeof(sUpLimits)/sizeof(sUpLimits[0]) && sUpLimits[index].valid)
        {
            limit = sUpLimits[index].outputLimit;
            return true;
        }
        DEBUG_PRINT(F("UNCALIBRATED SPEED - "));
        DEBUG_PRINT(speed);
        DEBUG_PRINT(F(" - "));
        DEBUG_PRINTLN(index);
        return false;
    }

    ///////////////////////////////////

public:
    static bool seekToTop(float speed = 0.5, bool usePID = true)
    {
        if (!usePID)
        {
            float mpower = sMinimumPower/100.0 + 0.05 + 0.1 * speed;
            Serial.print(F(" MOTOR: ")); Serial.println(mpower);

            // seek up
            bool topLimit;
            LifterStatus lifterStatus;
            for (;;)
            {
                topLimit = lifterTopLimit();
                if (topLimit || serialAbort())
                    break;
                lifterMotorMove(mpower);
                delay(3);
                lifterMotorStop();
                delay(1);
                if (!lifterStatus.isMoving())
                {
                    DEBUG_PRINTLN(F("ABORT"));
                    break;
                }
            }
            if (topLimit)
            {
                DEBUG_PRINTLN(F("TOP LIMIT REACHED"));
                resetLifterPositionTop();
            }
            return topLimit;
        }
        if (!isRotaryAtRest())
        {
            DEBUG_PRINTLN(F("ABORT: ROTARY NOT HOME"));
            DEBUG_PRINTLN(rotaryMotorCurrentPosition());
            return false;
        }
        speed = min(max(speed, 0.0f), 1.0f);
        TargetSteering steering(sLifterDistance);
        steering.setSampleTime(1);
        float limit;
        if (!getUpOutputLimit(speed, limit))
            return false;
        steering.setDistanceOutputLimits(limit);
    #ifdef USE_DEBUG
        uint32_t start = millis();
    #endif
        bool topLimit;
        LifterStatus lifterStatus;
        for (;;)
        {
            long encoder_ticks = getLifterPosition();
            topLimit = lifterTopLimit();
            if (topLimit || serialAbort())
                break;
            steering.setCurrentDistance(encoder_ticks);
            lifterMotorMove(steering.getThrottle() * speed);

            if (!lifterStatus.isMoving())
            {
                DEBUG_PRINT(F("LIFTER ABORTED AT ")); DEBUG_PRINTLN(encoder_ticks);
                break;
            }
        }
        lifterMotorStop();
    #ifdef USE_DEBUG
        uint32_t stop = millis();
    #endif
        if (topLimit)
        {
            DEBUG_PRINTLN(F("TOP LIMIT REACHED"));
            DEBUG_PRINT(F("DISTANCE: "));
            DEBUG_PRINTLN(getLifterPosition());
            DEBUG_PRINT(F("TIME: "));
            DEBUG_PRINTLN(stop - start);
            return true;
        }
        return false;
    }

    static bool seekToPositionSlow(float pos, float speed)
    {
        DEBUG_PRINT(F("SLOW: ")); DEBUG_PRINT(speed);
        // ensure position is in the range of 0.0 [bottom] - 1.0 [top]
        pos = min(max(abs(pos), 0.0f), 1.0f);
        if (isRotarySpinning() || !rotaryHomeLimit())
        {
            // Cannot go below 50% if spinning or not at home position
            pos = min(max(pos, 0.5f), 1.0f);
        }

        long maxlen = sLifterDistance;
        long target_ticks = pos * maxlen;
        bool success = false;
        float mpower = sMinimumPower/100.0 + 0.05 + 0.1 * speed;
        DEBUG_PRINT(F(" MOTOR: ")); DEBUG_PRINTLN(mpower);
        if (target_ticks > getLifterPosition())
        {
            // seek up
            bool topLimit;
            LifterStatus lifterStatus;
            for (;;)
            {
                long encoder_ticks = getLifterPosition();
                topLimit = lifterTopLimit();
                if (topLimit || encoder_ticks == target_ticks || serialAbort())
                    break;
                lifterMotorMove(mpower);
                delay(3);
                lifterMotorStop();
                delay(1);
                if (!lifterStatus.isMoving())
                {
                    DEBUG_PRINTLN(F("ABORT"));
                    break;
                }
            }
            success = topLimit;
        }
        else
        {
            // seek down
            bool botLimit;
            LifterStatus lifterStatus;
            for (;;)
            {
                long encoder_ticks = getLifterPosition();
                botLimit = lifterBottomLimit();
                if (botLimit || encoder_ticks == target_ticks || serialAbort())
                    break;
                lifterMotorMove(-mpower);
                delay(3);
                lifterMotorStop();
                delay(1);

                if (!lifterStatus.isMoving())
                {
                    DEBUG_PRINTLN(F("ABORT"));
                    break;
                }
            }
            success = botLimit;
        }
        lifterMotorStop();
        return success;
    }

    ///////////////////////////////////

    static bool readSettingsFromEEPROM()
    {
        size_t offs = 0;
        uint16_t siz = 0;
        uint32_t magic; 
        EEPROM.get(offs, magic); offs += sizeof(magic);
        if (magic == EEPROM_MAGIC)
        {
            uint32_t siz_offs = offs;
            uint16_t minpower = 0;
            uint16_t height = 0;
            uint32_t baudrate = 0;
            uint8_t i2caddr = 0;
            bool upcal = false;
            bool downcal = false;
            EEPROM.get(offs, siz); offs += sizeof(siz);
            EEPROM.get(offs, minpower); offs += sizeof(minpower);
            EEPROM.get(offs, height); offs += sizeof(height);
            EEPROM.get(offs, upcal); offs += sizeof(upcal);
            EEPROM.get(offs, downcal); offs += sizeof(downcal);
            EEPROM.get(offs, baudrate); offs += sizeof(baudrate);
            EEPROM.get(offs, i2caddr); offs += sizeof(i2caddr);
            memset(sUpLimits, '\0', sizeof(sUpLimits));
            if (upcal)
            {
                for (size_t i = minpower/5; i < sizeof(sUpLimits)/sizeof(sUpLimits[0]); i++)
                {
                    EEPROM.get(offs, sUpLimits[i].valid); offs += sizeof(sUpLimits[i].valid);
                    EEPROM.get(offs, sUpLimits[i].outputLimit); offs += sizeof(sUpLimits[i].outputLimit);
                }
            }
            memset(sDownLimits, '\0', sizeof(sDownLimits));
            if (downcal)
            {
                for (size_t i = minpower/5; i < sizeof(sDownLimits)/sizeof(sDownLimits[0]); i++)
                {
                    EEPROM.get(offs, sDownLimits[i].valid); offs += sizeof(sDownLimits[i].valid);
                    EEPROM.get(offs, sDownLimits[i].outputLimit); offs += sizeof(sDownLimits[i].outputLimit);
                }
            }
            if (offs-siz_offs != siz)
            {
                DEBUG_PRINTLN("Invalid EEPROM data");
                memset(sUpLimits, '\0', sizeof(sUpLimits));
                memset(sDownLimits, '\0', sizeof(sDownLimits));
                sUpLimitsCalibrated = false;
                sDownLimitsCalibrated = false;
                sMinimumPower = 0;
                return false;
            }
            sMinimumPower = minpower;
            sLifterDistance = height;
            sUpLimitsCalibrated = upcal;
            sDownLimitsCalibrated = downcal;
            sI2CAddress = i2caddr;
            if (sBaudRate != baudrate)
            {
                sBaudRate = baudrate;
            #ifndef USE_DEBUG
                Serial.begin(sBaudRate);
            #endif
            }
            return true;
        }
        return false;
    }

    static void writeSettingsToEEPROM()
    {
        size_t offs = 0;
        uint32_t magic = EEPROM_MAGIC; 
        EEPROM.put(offs, magic); offs += sizeof(magic);
        // Reserve space for offset field
        uint16_t siz = 0;
        size_t siz_offs = offs; offs += sizeof(siz);
        EEPROM.put(offs, sMinimumPower); offs += sizeof(sMinimumPower);
        EEPROM.put(offs, sLifterDistance); offs += sizeof(sLifterDistance);
        EEPROM.put(offs, sUpLimitsCalibrated); offs += sizeof(sUpLimitsCalibrated);
        EEPROM.put(offs, sDownLimitsCalibrated); offs += sizeof(sDownLimitsCalibrated);
        EEPROM.put(offs, sBaudRate); offs += sizeof(sBaudRate);
        EEPROM.put(offs, sI2CAddress); offs += sizeof(sI2CAddress);
        if (sUpLimitsCalibrated)
        {
            for (size_t i = sMinimumPower/5; i < sizeof(sUpLimits)/sizeof(sUpLimits[0]); i++)
            {
                EEPROM.put(offs, sUpLimits[i].valid); offs += sizeof(sUpLimits[i].valid);
                EEPROM.put(offs, sUpLimits[i].outputLimit); offs += sizeof(sUpLimits[i].outputLimit);
            }
        }
        if (sDownLimitsCalibrated)
        {
            for (size_t i = sMinimumPower/5; i < sizeof(sDownLimits)/sizeof(sDownLimits[0]); i++)
            {
                EEPROM.put(offs, sDownLimits[i].valid); offs += sizeof(sDownLimits[i].valid);
                EEPROM.put(offs, sDownLimits[i].outputLimit); offs += sizeof(sDownLimits[i].outputLimit);
            }
        }
        EEPROM.put(siz_offs, offs-siz_offs);

        // Check for the command section magic code
        // if it's missing we need to write out a terminating byte
        EEPROM.get(offs, magic);
        if (magic != EEPROM_CMD_MAGIC)
        {
            magic = EEPROM_CMD_MAGIC;
            EEPROM.put(offs, magic); offs += sizeof(magic);
        
            uint8_t tag = EEPROM_END_TAG;
            EEPROM.put(offs, tag); offs += sizeof(tag);
        }
    }

    static void clearCommandsFromEEPROM()
    {
        uint16_t offs = 0;
        uint32_t magic;
        EEPROM.get(offs, magic); offs += sizeof(magic);
        if (magic == EEPROM_MAGIC)
        {
            uint16_t siz = 0;
            EEPROM.get(offs, siz); offs += siz;

            EEPROM.get(offs, magic); offs += sizeof(magic);
            if (magic == EEPROM_CMD_MAGIC)
            {
                uint8_t tag = EEPROM_END_TAG;
                EEPROM.put(offs, tag);
                Serial.println(F("Cleared"));
            }
        }
    }

    static void listCommandsFromEEPROM()
    {
        uint16_t offs = 0;
        uint32_t magic;
        EEPROM.get(offs, magic); offs += sizeof(magic);
        if (magic == EEPROM_MAGIC)
        {
            uint16_t siz = 0;
            EEPROM.get(offs, siz); offs += siz;

            EEPROM.get(offs, magic); offs += sizeof(magic);
            if (magic == EEPROM_CMD_MAGIC)
            {
                while (offs <= EEPROM.length())
                {
                    uint8_t snum;
                    EEPROM.get(offs, snum); offs += sizeof(snum);
                    if (snum == EEPROM_END_TAG)
                        break;
                    Serial.print('[');
                    Serial.print(snum);
                    Serial.print(']');
                    Serial.print(' ');
                    Serial.print(':');
                    Serial.print('P');
                    uint8_t len;
                    EEPROM.get(offs, len); offs += sizeof(len);
                    while (len > 0)
                    {
                        char ch;
                        EEPROM.get(offs, ch); offs += sizeof(ch);
                        Serial.print((char)ch);
                        len--;
                    }
                    Serial.println();
                }
            }
        }
        Serial.println(F("Complete"));
    }

    static void listSortedCommandsFromEEPROM()
    {
        typedef uint32_t BMAPWORD;
    #define BMAPWORD_GRANULARITY    (sizeof(BMAPWORD))
    #define BMAPWORD_BIT_SIZE       (sizeof(BMAPWORD) * 8)
    #define BIT_MAPWORD(bitpos)     (0x1L << (BMAPWORD_BIT_SIZE - 1 - (bitpos)))
    #define SET_MAPWORD_BIT(value, bit) {\
        uint8_t bitpos = (value) % sizeof(usedBitmap[0]); \
        uint8_t wordpos = (value) / sizeof(usedBitmap[0]); \
        usedBitmap[wordpos] = (usedBitmap[wordpos] & ~(BIT_MAPWORD(bitpos))) | (uint32_t(bit) << (BMAPWORD_BIT_SIZE - 1 - bitpos)); }
    #define MAPWORD_BIT(value) \
        ((usedBitmap[(value) / sizeof(usedBitmap[0])] & BIT_MAPWORD((value) % sizeof(usedBitmap[0]))) != 0)

        uint16_t offs = 0;
        uint32_t magic;
        uint32_t usedBitmap[MAX_COMMANDS / sizeof(uint32_t)+1];
        memset(&usedBitmap, '\0', sizeof(usedBitmap));
        EEPROM.get(offs, magic); offs += sizeof(magic);
        if (magic == EEPROM_MAGIC)
        {
            uint16_t siz = 0;
            EEPROM.get(offs, siz); offs += siz;

            EEPROM.get(offs, magic); offs += sizeof(magic);
            if (magic == EEPROM_CMD_MAGIC)
            {
                uint16_t scanoffs = offs;
                while (scanoffs <= EEPROM.length())
                {
                    uint8_t snum;
                    EEPROM.get(scanoffs, snum); scanoffs += sizeof(snum);
                    if (snum == EEPROM_END_TAG)
                        break;

                    SET_MAPWORD_BIT(snum, 1);
                    uint8_t len;
                    EEPROM.get(scanoffs, len); scanoffs += sizeof(len) + len;
                }
            }
        }
        for (unsigned i = 0; i < 100; i++)
        {
            if (MAPWORD_BIT(i))
            {
                uint16_t scanoffs = offs;
                while (scanoffs <= EEPROM.length())
                {
                    uint8_t snum;
                    EEPROM.get(scanoffs, snum); scanoffs += sizeof(snum);
                    if (snum == EEPROM_END_TAG)
                        break;
                    if (snum == i)
                    {
                        Serial.print('[');
                        Serial.print(snum);
                        Serial.print(']');
                        Serial.print(' ');
                        Serial.print(':');
                        Serial.print('P');
                    }
                    uint8_t len;
                    EEPROM.get(scanoffs, len); scanoffs += sizeof(len);
                    if (snum == i)
                    {
                        while (len > 0)
                        {
                            char ch;
                            EEPROM.get(scanoffs, ch); scanoffs += sizeof(ch);
                            Serial.print((char)ch);
                            len--;
                        }
                        Serial.println();
                        break;
                    }
                    else
                    {
                        scanoffs += len;
                    }
                }
            }
        }
        Serial.println(F("Complete"));
    #undef MAPWORD_BIT
    #undef SET_MAPWORD_BIT
    #undef BIT_MAPWORD
    #undef BMAPWORD_BIT_SIZE
    #undef BMAPWORD_GRANULARITY
    }

    static bool readCommandFromEEPROM(uint8_t num, char* cmd, uint16_t* cmdoffs = nullptr)
    {
        uint16_t offs = 0;
        uint32_t magic;
        EEPROM.get(offs, magic); offs += sizeof(magic);
        if (magic == EEPROM_MAGIC)
        {
            uint16_t siz = 0;
            EEPROM.get(offs, siz); offs += siz;

            EEPROM.get(offs, magic); offs += sizeof(magic);
            if (magic == EEPROM_CMD_MAGIC)
            {
                while (offs <= EEPROM.length())
                {
                    uint8_t snum;
                    EEPROM.get(offs, snum);
                    if (snum == EEPROM_END_TAG)
                        break;
                    if (snum == num && cmdoffs != nullptr)
                        *cmdoffs = offs;
                    uint8_t len;
                    offs += sizeof(snum);
                    EEPROM.get(offs, len); offs += sizeof(len);
                    if (snum == num)
                    {
                        if (cmd != nullptr)
                        {
                            char* ch = cmd;
                            *ch++ = ':';
                            *ch++ = 'P';
                            while (len > 0)
                            {
                                EEPROM.get(offs, *ch); offs += sizeof(*ch);
                                ch++;
                                len--;
                            }
                            *ch = '\0';
                        }
                        return true;
                    }
                    else
                    {
                        offs += len;
                    }
                }
            }
        }
        return false;
    }

    static bool deleteCommandFromEEPROM(uint8_t num)
    {
        uint16_t writeoffs;
        if (!readCommandFromEEPROM(num, nullptr, &writeoffs))
            return false;

        uint8_t len;
        uint16_t readoffs = writeoffs + 1;
        EEPROM.get(readoffs, len); readoffs += sizeof(len);
        readoffs += len;

        while (readoffs < EEPROM.length())
        {
            uint8_t tag;
            EEPROM.get(readoffs, tag); readoffs += sizeof(tag);
            EEPROM.put(writeoffs, tag); writeoffs += sizeof(tag);
            if (tag == EEPROM_END_TAG)
            {
                // End of buffer
                break;
            }
            uint8_t readlen;
            EEPROM.get(readoffs, readlen); readoffs += sizeof(readlen);
            EEPROM.put(writeoffs, readlen); writeoffs += sizeof(readlen);
            while (readlen > 0)
            {
                char ch;
                EEPROM.get(readoffs, ch); readoffs += sizeof(ch);
                EEPROM.put(writeoffs, ch); writeoffs += sizeof(ch);
                readlen--;
            }
        }
        return true;
    }

    static bool writeCommandToEEPROM(uint8_t num, const char* cmd)
    {
        // delete old command if it exists
        deleteCommandFromEEPROM(num);

        size_t offs = 0;
        uint32_t magic;
        EEPROM.get(offs, magic); offs += sizeof(magic);

        if (magic == EEPROM_MAGIC)
        {
            uint16_t siz = 0;
            EEPROM.get(offs, siz); offs += siz;

            EEPROM.get(offs, magic); offs += sizeof(magic);
            if (magic == EEPROM_CMD_MAGIC)
            {
                // append command to end of buffer
                while (offs <= EEPROM.length())
                {
                    uint8_t tag;
                    EEPROM.get(offs, tag);
                    if (tag == EEPROM_END_TAG)
                    {
                        EEPROM.put(offs, num); offs += sizeof(num);

                        uint8_t len = strlen(cmd);
                        EEPROM.put(offs, len); offs += sizeof(len);
                        while (len > 0)
                        {
                            EEPROM.put(offs, *cmd); offs += sizeof(*cmd);
                            cmd++;
                            len--;
                        }
                        // Write terminate byte
                        num = EEPROM_END_TAG;
                        EEPROM.put(offs, num); offs += sizeof(num);
                        return true;
                    }
                    offs += sizeof(tag);
                    uint8_t len;
                    EEPROM.get(offs, len); offs += sizeof(len) + len;
                }
            }
            else
            {
                // start new command buffer
                magic = EEPROM_CMD_MAGIC;
                EEPROM.put(offs, magic); offs += sizeof(magic);
                
                EEPROM.put(offs, num); offs += sizeof(num);

                uint8_t len = strlen(cmd);
                EEPROM.put(offs, len); offs += sizeof(len);
                while (len > 0)
                {
                    EEPROM.put(offs, *cmd); offs += sizeof(*cmd);
                    cmd++;
                    len--;
                }
                // Write terminate byte
                num = EEPROM_END_TAG;
                EEPROM.put(offs, num); offs += sizeof(num);
                return true;
            }
        }
        else
        {
            Serial.println("Must calibrate first");
        }
        return false;
    }

    class RotaryStatus
    {
    public:
        RotaryStatus()
        {
            resetRotaryChangedState();
            encoder_rotary_last_status = millis();
        }

        bool isMoving()
        {
            if (millis() - encoder_rotary_last_status >= ENCODER_STATUS_RATE)
            {
                encoder_rotary_last_status = millis();
                if (encoder_rotary_changed < 20)
                    return false;
                resetRotaryChangedState();
            }
            return true;
        }
    };

    class LifterStatus
    {
    public:
        LifterStatus()
        {
            resetLifterChangedState();
            encoder_lifter_last_status = millis();
        }

        bool isMoving()
        {
            if (millis() - encoder_lifter_last_status >= ENCODER_STATUS_RATE)
            {
                encoder_lifter_last_status = millis();
                if (encoder_lifter_changed < 20)
                    return false;
                resetLifterChangedState();
            }
            return !lifterMotorFault();
        }
    };

    ///////////////////////////////////

    static volatile long encoder_lifter_ticks;
    static long encoder_lifter_ticks_old;
    static volatile int encoder_lifter_pin_A_last;
    static volatile int encoder_lifter_val;
    static volatile uint16_t encoder_lifter_changed;
    static uint32_t encoder_lifter_last_status;

    ///////////////////////////////////

    static volatile long encoder_rotary_ticks;
    static volatile long encoder_rotary_stop_ticks;
    static long encoder_rotary_ticks_old;
    static volatile int encoder_rotary_pin_A_last;
    static volatile int encoder_rotary_val;
    static volatile uint16_t encoder_rotary_changed;
    static volatile bool encoder_rotary_stop_limit;
    static uint32_t encoder_rotary_last_status;

    static bool fMotorsEnabled;
    static uint32_t fMotorsEnabledTime;
    static float fLifterThrottle;
    static float fRotarySpeed;
    static float fRotaryThrottle;
    static uint32_t fRotaryThrottleUpdate;
    static uint32_t fRotaryEncoderLastStatus;
    static long fRotaryEncoderLastTick;
    static bool fRotaryMoving;
};

volatile long PeriscopeLifter::encoder_lifter_ticks;
long PeriscopeLifter::encoder_lifter_ticks_old;
volatile int PeriscopeLifter::encoder_lifter_pin_A_last;
volatile int PeriscopeLifter::encoder_lifter_val;
volatile uint16_t PeriscopeLifter::encoder_lifter_changed;
uint32_t PeriscopeLifter::encoder_lifter_last_status;

volatile long PeriscopeLifter::encoder_rotary_ticks;
volatile long PeriscopeLifter::encoder_rotary_stop_ticks;
long PeriscopeLifter::encoder_rotary_ticks_old;
volatile int PeriscopeLifter::encoder_rotary_pin_A_last;
volatile int PeriscopeLifter::encoder_rotary_val;
volatile uint16_t PeriscopeLifter::encoder_rotary_changed;
volatile bool PeriscopeLifter::encoder_rotary_stop_limit;
uint32_t PeriscopeLifter::encoder_rotary_last_status;

bool PeriscopeLifter::fMotorsEnabled;
uint32_t PeriscopeLifter::fMotorsEnabledTime;
float PeriscopeLifter::fLifterThrottle = 0;
float PeriscopeLifter::fRotarySpeed = 0;
float PeriscopeLifter::fRotaryThrottle = 0;
uint32_t PeriscopeLifter::fRotaryThrottleUpdate = 0;
uint32_t PeriscopeLifter::fRotaryEncoderLastStatus;
long PeriscopeLifter::fRotaryEncoderLastTick;
bool PeriscopeLifter::fRotaryMoving = 0;

///////////////////////////////////////////////////////

PeriscopeLifter lifter;

///////////////////////////////////
// I2C Events
///////////////////////////////////

#ifdef I2C_ADDRESS
static bool sI2CCmdReady;
static char sI2CCmdString[32];
static void i2cEvent(int /*howMany*/)
{
    for (byte i = 0; Wire.available();)
    {
        char ch = (char)Wire.read();
        // Ignore leading whitespace
        if (i != 0 || !isspace(ch))
        {
            if (ch >= 1 && ch <= 7)
            {
                // Support IA periscope commands 1-7
                ch = '0'+ch;
                sI2CCmdReady = true;
            }
            if (ch != '\r' && ch != '\n')
            {
                if (i < sizeof(sI2CCmdString) - 1)
                {
                    sI2CCmdString[i++] = ch;
                    sI2CCmdString[i] = 0;
                }
            }
            else
            {
                sI2CCmdReady = true;
            }
        }
    }
}

static void handleI2CEvent()
{
    if (!sI2CCmdReady)
        return;

    // First check if IA periscope event
    if (isdigit(sI2CCmdString[0]))
    {
        uint8_t seq = min(max(atoi(sI2CCmdString), 0), MAX_COMMANDS);
        Serial.print(F("I2C SEQUENCE: ")); Serial.println(seq);
        if (!lifter.readCommandFromEEPROM(seq, sCmdBuffer))
        {
            sCmdBuffer[0] = '\0';
        }
    }
    else
    {
        // Skip :P and only allows a single command
        processLifterCommand(sI2CCmdString);
    }
    sI2CCmdString[0] = '\0';
    sI2CCmdReady = false;
}
#endif

///////////////////////////////////////////////////////

void setup()
{
    REELTWO_READY();
#ifndef USE_DEBUG
    Serial.begin(SERIAL_BAUD_RATE);
#endif
    SetupEvent::ready();
    //////////////////////////

#ifdef I2C_ADDRESS
    Wire.onReceive(i2cEvent);
    Wire.begin(sI2CAddress);
#endif

    Serial.println(F("READY"));
}

int atoi(const char* cmd, int numdigits)
{
    int result = 0;
    for (int i = 0; i < numdigits; i++)
        result = result*10 + (cmd[i]-'0');
    return result;
}

int32_t strtol(const char* cmd, const char** endptr)
{
    bool sign = false;
    int32_t result = 0;
    if (*cmd == '-')
    {
        cmd++;
        sign = true;
    }
    while (isdigit(*cmd))
    {
        result = result*10L + (*cmd-'0');
        cmd++;
    }
    *endptr = cmd;
    return (sign) ? -result : result;
}

uint32_t strtolu(const char* cmd, const char** endptr)
{
    uint32_t result = 0;
    while (isdigit(*cmd))
    {
        result = result*10L + (*cmd-'0');
        cmd++;
    }
    *endptr = cmd;
    return result;
}

bool startswith(const char* &cmd, const char* str)
{
    size_t len = strlen(str);
    if (strncmp(cmd, str, strlen(str)) == 0)
    {
        cmd += len;
        return true;
    }
    return false;
}

bool processLifterCommand(const char* cmd)
{
    switch (*cmd++)
    {
        case 'S':
        {
            // play sequence
            uint32_t seq = strtolu(cmd, &cmd);
            if (*cmd == '\0')
            {
                seq = min(max(seq, 0), MAX_COMMANDS);
                if (!lifter.readCommandFromEEPROM(seq, sCmdBuffer))
                {
                    sCmdBuffer[0] = '\0';
                }
            }
            break;
        }
        case 'P':
        {
            // seek lifter to position
            float speed = 1.0;
            uint32_t pos;
            if (*cmd == 'R')
            {
                pos = random(100);
                cmd++;
            }
            else
            {
                pos = strtolu(cmd, &cmd);
            }
            if (*cmd == ',')
            {
                uint32_t speedpercentage = strtolu(cmd+1, &cmd);
                if (*cmd == '\0')
                {
                    speedpercentage = min(max(speedpercentage, sMinimumPower), 100);
                    speed = speedpercentage / 100.0;
                }
            }
            if (*cmd == '\0' || *cmd == ':')
            {
                pos = min(max(pos, 0), 100);
                Serial.print(F("POSITION: ")); Serial.print(pos);
                Serial.print(F(" SPEED: ")); Serial.println(int(speed*100));
                lifter.seekToPosition(pos/100.0, speed);
            }
            break;
        }
        case 'R':
        {
            // spin rotary speed
            int32_t speed = 0;
            if (*cmd == 'R')
            {
                speed = strtolu(cmd+1, &cmd);
                if (speed == 0)
                    speed = 80;
                speed = max(speed, ROTARY_MINIMUM_POWER);
                speed = -speed + random(speed*2);
                if (abs(speed) < ROTARY_MINIMUM_POWER)
                    speed = (speed < 0) ? -ROTARY_MINIMUM_POWER : ROTARY_MINIMUM_POWER;
            }
            else
            {
                speed = strtol(cmd, &cmd);
            }
            if (*cmd == '\0' && lifter.rotaryAllowed())
            {
                speed = min(max(speed, -100), 100);
                Serial.print(F("ROTARY SPEED: ")); Serial.println(speed);
                if (speed == 0)
                {
                    lifter.rotateHome();
                }
                else
                {
                    lifter.rotaryMotorSpeed(speed / 100.0);
                }
            }
            break;
        }
        case 'A':
        {
            // position absolute degree
            float speed = 0;
            float maxspeed = 0;
            int32_t degrees;
            if (*cmd == 'R' && (cmd[1] == ',' || cmd[1] == '\0'))
            {
                degrees = random(360);
                cmd++;
            }
            else
            {
                degrees = strtol(cmd, &cmd);
            }
            if (*cmd == ',')
            {
                uint32_t speedpercentage;
                if (cmd[1] == 'R' && (cmd[2] == ',' || cmd[2] == '\0'))
                {
                    speedpercentage = random(100);
                    cmd += 2;
                }
                else
                {
                    speedpercentage = strtolu(cmd+1, &cmd);
                }
                if (*cmd == ',' || *cmd == '\0')
                {
                    speedpercentage = max(min(max(speedpercentage, 0), 100), ROTARY_MINIMUM_POWER);
                    speed = speedpercentage / 100.0;
                }
            }
            if (*cmd == ',')
            {
                uint32_t speedpercentage;
                if (cmd[1] == 'R' && (cmd[2] == ',' || cmd[2] == '\0'))
                {
                    speedpercentage = speed * 100.0 + random(100 - speed * 100.0);
                    cmd += 2;
                }
                else
                {
                    speedpercentage = strtolu(cmd+1, &cmd);
                }
                if (*cmd == '\0')
                {
                    speedpercentage = max(min(max(speedpercentage, 0), 100), speed*100);
                    maxspeed = speedpercentage / 100.0;
                }
            }
            if (*cmd == '\0' && lifter.rotaryAllowed())
            {
                Serial.print(F("ROTARY DEGREE: ")); Serial.println(degrees);
                if (degrees == 0)
                {
                    lifter.rotateHome();
                }
                else
                {
                    lifter.rotaryMotorAbsolutePosition(degrees, speed, maxspeed);
                }
            }
            break;
        }
        case 'D':
        {
            // position relative degree
            int32_t degrees;
            if (*cmd == 'R' && (cmd[1] == ',' || cmd[1] == '\0'))
            {
                degrees = random(360);
                cmd++;
            }
            else
            {
                degrees = strtol(cmd, &cmd);
            }
            if (*cmd == '\0' && lifter.rotaryAllowed())
            {
                Serial.print(F("ROTARY DEGREE: ")); Serial.println(degrees);
                if (degrees == 0)
                {
                    lifter.rotateHome();
                }
                else
                {
                    lifter.rotaryMotorRelativePosition(degrees);
                }
            }
            break;
        }
        case 'W':
        {
            // wait seconds
            bool rand = false;
            uint32_t seconds;
            Serial.print("WAIT: "); Serial.println(cmd);
            if ((rand = (*cmd == 'R')))
                cmd++;
            seconds = strtolu(cmd, &cmd);
            if (rand)
            {
                Serial.println(seconds);
                if (seconds == 0)
                    seconds = 6;
                seconds = random(1, seconds);
                Serial.println(seconds);
            }
            Serial.print("WAIT SECONDS: "); Serial.println(seconds);
            if (*cmd == '\0')
            {
                sWaitNextSerialCommand = millis() + uint32_t(min(max(seconds, 1), 600)) * 1000L;
            }
            break;
        }
        case 'L':
        {
            // play light sequence
            uint32_t seq;
            if (*cmd == 'R' && cmd[1] == '\0')
            {
                do
                {
                    seq = random(8);
                }
                while (seq == lifter.kLightKit_Off);
                Serial.print("RAND: "); Serial.println(seq);
                cmd++;
            }
            else
            {
                seq = strtolu(cmd, &cmd);
            }
            if (*cmd == '\0')
            {
                seq = min(max(seq, 0), 7);
                if (seq == 0 && seq != lifter.kLightKit_Off)
                {
                    lifter.setLightShow(lifter.kLightKit_Off);
                    delay(10);
                }
                Serial.print(F("LIGHT: ")); Serial.println(seq);
                lifter.setLightShow(seq);
            }
            break;
        }
        case 'H':
        {
            // return home
            lifter.ensureSafetyManeuver();
            if (!lifter.lifterBottomLimit())
            {
                uint32_t speed = sMinimumPower;
                lifter.rotateHome();
                lifter.setLightShow(lifter.kLightKit_Off);
                lifter.rotateHome();
                if (isdigit(*cmd))
                {
                    speed = min(max(strtolu(cmd, &cmd), sMinimumPower), 100);
                }
                if (!lifter.seekToPosition(0, speed/100.0))
                {
                    // If we failed we try one more time
                    lifter.seekToPosition(1.0, speed/100.0);
                    lifter.rotateHome();
                    lifter.rotateHome();
                    lifter.seekToPosition(0, speed/100.0);
                }
            }
            break;
        }
        default:
            Serial.println(F("Invalid"));
            return false;
    }
    return true;
}

void processConfigureCommand(const char* cmd)
{
    if (strcmp(cmd, "#PSC") == 0)
    {
        // calibrate
        if (!lifter.calibrate())
            lifter.disableMotors();
    }
    else if (startswith(cmd, "#PZERO"))
    {
        lifter.clearCommandsFromEEPROM();
    }
    else if (startswith(cmd, "#PL"))
    {
        lifter.listSortedCommandsFromEEPROM();//listCommandsFromEEPROM();
    }
    else if (startswith(cmd, "#PD"))
    {
        if (isdigit(*cmd))
        {
            uint32_t seq = strtolu(cmd, &cmd);
            Serial.println(seq);
            if (lifter.deleteCommandFromEEPROM(seq))
                Serial.println(F("Deleted"));
        }
    }
    else if (startswith(cmd, "#PBAUD"))
    {
        uint32_t baudrate = strtolu(cmd, &cmd);
        if (baudrate > 1200 && sBaudRate != baudrate)
        {
            sBaudRate = baudrate;
            Serial.print(F("Next reboot new baud rate: ")); Serial.println(sBaudRate);
            lifter.writeSettingsToEEPROM();
        }
    }
    else if (startswith(cmd, "#PI2C"))
    {
        uint8_t addr = strtolu(cmd, &cmd);
        if (addr && sI2CAddress != addr)
        {
            sI2CAddress = addr;
            Serial.print(F("Next reboot new i2c address: ")); Serial.println(sI2CAddress);
            lifter.writeSettingsToEEPROM();
        }
    }
    else if (startswith(cmd, "#PS"))
    {
        uint32_t storeseq = strtolu(cmd, &cmd);
        if (*cmd == ':')
        {
            storeseq = min(max(storeseq, 0), 100);
            const char* startcmd = ++cmd;
            while (*cmd != '\0')
            {
                switch (*cmd)
                {
                    case 'P':
                    {
                        // position
                        float speed = 1.0;
                        uint32_t pos = strtolu(cmd+1, &cmd);
                        // optional speed
                        if (*cmd == ',')
                        {
                            uint32_t speedpercentage = strtolu(cmd+1, &cmd);
                            speedpercentage = max(min(max(speedpercentage, 0), 100), sMinimumPower);
                            speed = speedpercentage / 100.0;
                        }
                        pos = min(max(pos, 0), 100);
                        Serial.print(F("Lifter Position: "));
                        Serial.print(pos);
                        Serial.print(F(" Speed: ")); Serial.println(int(speed*100));
                        break;
                    }
                    case 'R':
                    {
                        // speed
                        int32_t speed = strtol(cmd+1, &cmd);
                        speed = min(max(speed, -100), 100);
                        Serial.print(F("Rotate Scope Speed: "));
                        Serial.println(speed);
                        break;
                    }
                    case 'A':
                    {
                        bool randdegrees = false;
                        bool randspeed = false;
                        bool randmax = false;
                        uint32_t speed = 0;
                        uint32_t maxspeed = 0;
                        int32_t degrees = 0;
                        cmd += 1;
                        if (*cmd == 'R')
                        {
                            randdegrees = true;
                            cmd++;
                        }
                        else
                        {
                            degrees = strtol(cmd, &cmd);
                        }
                        Serial.println(cmd);
                        // optional speed
                        if (*cmd == ',')
                        {
                            if (cmd[1] == 'R')
                            {
                                randspeed = true;
                                cmd += 2;
                            }
                            else
                            {
                                speed = strtolu(cmd+1, &cmd);
                                speed = max(min(max(speed, 0), 100), ROTARY_MINIMUM_POWER);
                            }
                        }
                        // optional maxspeed
                        if (*cmd == ',')
                        {
                            if (cmd[1] == 'R')
                            {
                                randmax = true;
                                cmd += 2;
                            }
                            else
                            {
                                maxspeed = strtolu(cmd+1, &cmd);
                                maxspeed = max(min(max(maxspeed, 0), 100), speed);
                            }
                        }
                        Serial.print(F("Rotate Absolute Degrees: "));
                        if (randdegrees)
                            Serial.print(F("Random"));
                        else
                            Serial.print(degrees);
                        if (speed != 0 || randspeed)
                        {
                            Serial.print(F(" Speed: "));
                            if (randspeed)
                                Serial.print(F("Random"));
                            else
                                Serial.print(speed);
                        }
                        if (maxspeed != 0 || randmax)
                        {
                            Serial.print(F(" Max Speed: "));
                            if (randmax)
                                Serial.print(F("Random"));
                            else
                                Serial.print(maxspeed);
                        }
                        Serial.println();
                        break;
                    }
                    case 'D':
                    {
                        // degrees
                        bool randdegrees = false;
                        int32_t degrees = 0;
                        cmd++;
                        if (*cmd == 'R')
                        {
                            randdegrees = true;
                            cmd++;
                        }
                        else
                        {
                            degrees = strtolu(cmd, &cmd);
                        }
                        Serial.print(F("Rotate Relative Degrees: "));
                        if (randdegrees)
                            Serial.println(F("Random"));
                        else
                            Serial.println(degrees);
                        break;
                    }
                    case 'W':
                    {
                        // seconds
                        bool randseconds = false;
                        uint32_t seconds = 0;
                        cmd++;
                        if (*cmd == 'R')
                        {
                            randseconds = true;
                            cmd++;
                        }
                        seconds = strtolu(cmd, &cmd);
                        seconds = min(max(seconds, 0), 600);
                        Serial.print(F("Wait Seconds: "));
                        if (randseconds)
                            Serial.println(F("Random"));
                        else
                            Serial.println(seconds);
                        break;
                    }
                    case 'L':
                    {
                        // light kit sequence
                        uint32_t seq = 0;
                        bool randseq = false;
                        cmd++;
                        if (*cmd == 'R')
                        {
                            seq = true;
                            cmd++;
                        }
                        else
                        {
                            seq = strtolu(cmd, &cmd);
                        }
                        seq = min(max(seq, 0), 7);
                        Serial.print(F("Light Kit Sequence: "));
                        if (randseq)
                            Serial.println(F("Random"));
                        else
                            Serial.println(seq);
                        break;
                    }
                    case 'H':
                    {
                        // return home
                        uint32_t speed = sMinimumPower; cmd++;
                        if (isdigit(*cmd))
                        {
                            speed = min(max(strtolu(cmd, &cmd), sMinimumPower), 100);
                        }
                        Serial.print(F("Return Home: Speed: ")); Serial.println(speed);
                        break;
                    }
                    default:
                        cmd = nullptr;
                        break;
                }
                if (cmd != nullptr && *cmd == ':')
                {
                    cmd++;
                }
                else if (cmd == nullptr || *cmd != '\0')
                {
                    Serial.println(F("Invalid"));
                    Serial.println(cmd);
                    cmd = nullptr;
                    break;
                }
            }
            if (cmd != nullptr && *cmd == '\0')
            {
                Serial.print(F("Sequence ["));
                Serial.print(storeseq);
                Serial.print(F("]: "));
                Serial.println(startcmd);
                sCmdBuffer[0] = '\0';
                if (lifter.writeCommandToEEPROM(storeseq, startcmd))
                    Serial.println(F("Stored"));
                else
                    Serial.println(F("Failed"));
            }
        }
        else
        {
            Serial.println(F("Invalid"));
        }
    }
}

bool processCommand(const char* cmd, bool firstCommand)
{
    sWaitNextSerialCommand = 0;
    if (*cmd == '\0')
        return true;
    if (!firstCommand)
    {
        if (cmd[0] != ':')
        {
            Serial.println(F("Invalid"));
            return false;
        }
        return processLifterCommand(cmd+1);
    }
    switch (cmd[0])
    {
        case ':':
            if (cmd[1] == 'P')
                return processLifterCommand(cmd+2);
            break;
        case '#':
            processConfigureCommand(cmd);
            return true;
        default:
            Serial.println(F("Invalid"));
            break;
    }
    return false;
}

void loop()
{
    handleI2CEvent();
    lifter.rotaryMotorUpdate();

    // append commands to command buffer
    if (Serial.available())
    {
        int ch = Serial.read();
        if (ch == 0x0A || ch == 0x0D)
        {
            runSerialCommand();
        }
        else if (sPos < SizeOfArray(sBuffer)-1)
        {
            sBuffer[sPos++] = ch;
            sBuffer[sPos] = '\0';
        }
    }
    if (sProcessing && millis() > sWaitNextSerialCommand)
    {
        if (sCmdBuffer[0] == ':')
        {
            char* end = strchr(sCmdBuffer+1, ':');
            if (end != nullptr)
                *end = '\0';
            if (!processCommand(sCmdBuffer, !sCmdNextCommand))
            {
                // command invalid abort buffer
                DEBUG_PRINT(F("Unrecognized: ")); DEBUG_PRINTLN(sCmdBuffer);
                sWaitNextSerialCommand = 0;
                end = nullptr;
            }
            if (end != nullptr)
            {
                *end = ':';
                strcpy(sCmdBuffer, end);
                DEBUG_PRINT(F("REMAINS: "));
                DEBUG_PRINTLN(sCmdBuffer);
                sCmdNextCommand = true;
            }
            else
            {
                sCmdBuffer[0] = '\0';
                sCmdNextCommand = false;
            }
        }
        else if (sBuffer[0] == ':')
        {
            char* end = strchr(sBuffer+1, ':');
            if (end != nullptr)
                *end = '\0';
            if (!processCommand(sBuffer, !sNextCommand))
            {
                // command invalid abort buffer
                DEBUG_PRINT(F("Unrecognized: ")); DEBUG_PRINTLN(sBuffer);
                sWaitNextSerialCommand = 0;
                end = nullptr;
            }
            if (end != nullptr)
            {
                *end = ':';
                strcpy(sBuffer, end);
                sPos = strlen(sBuffer);
                DEBUG_PRINT(F("REMAINS: "));
                DEBUG_PRINTLN(sBuffer);
                sNextCommand = true;
            }
            else
            {
                resetSerialCommand();
                sBuffer[0] = '\0';
            }
        }
        else
        {
            processCommand(sBuffer, true);
            resetSerialCommand();
        }
    }
    if (lifter.isIdle() && lifter.motorsEnabled())
    {
        DEBUG_PRINTLN("DISABLE MOTORS");
        lifter.disableMotors();
    }
#ifdef USE_DEBUG
    static bool sLastTop;
    static bool sLastBot;
    static bool sLastRot;
    static long sLastLifter;
    static long sLastRotary;
    if (sLastTop != lifter.lifterTopLimit() ||
        sLastBot != lifter.lifterBottomLimit() ||
        sLastRot != lifter.rotaryHomeLimit() ||
        sLastLifter != lifter.getLifterPosition() ||
        sLastRotary != lifter.getRotaryPosition())
    {
        sLastTop = lifter.lifterTopLimit();
        sLastBot = lifter.lifterBottomLimit();
        sLastRot = lifter.rotaryHomeLimit();
        sLastLifter = lifter.getLifterPosition();
        sLastRotary = lifter.getRotaryPosition();
        DEBUG_PRINT(F("T: ")); DEBUG_PRINT(sLastTop);
        DEBUG_PRINT(F(" B: ")); DEBUG_PRINT(sLastBot);
        DEBUG_PRINT(F(" R: ")); DEBUG_PRINT(sLastRot);
        DEBUG_PRINT(F(" H: ")); DEBUG_PRINT(sLastLifter/float(sLifterDistance)*100.0);
        DEBUG_PRINT(F(" D: ")); DEBUG_PRINT(lifter.rotaryMotorCurrentPosition());
        DEBUG_PRINT(F(" P: ")); DEBUG_PRINT(lifter.getRotaryPosition());
        DEBUG_PRINT(F(" F: ")); DEBUG_PRINT(lifter.lifterMotorFault());
        DEBUG_PRINTLN();
    }
#endif
}
