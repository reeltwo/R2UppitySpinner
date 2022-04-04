# R2 Uppity Spinner

This is the sketch for the R2 Uppity Spinner. It depends on the Reeltwo library. You can download the latest release of the Reeltwo library here: https://github.com/reeltwo/Reeltwo/releases

[![Uppity Spinner](https://i.vimeocdn.com/video/1153816619-6fef8819cf32b562e0519537a46baed562bb51651010442a9ccdd9909c40952e-d_640x360)](https://vimeo.com/558277516)

Default baud rate is 9600 baud and the default I2C address is 32 (0x20). Both can be changed using the configuration commands below.

After installing your board you should run the `#PSC` calibration command.

If you want a snappy hyper caffinated periscope you should use a 6V lifter motor. If you want a slower more deliberate periscope you should use a 12V lifter motor.

# Assembling R2 Uppity Spinner PCB Part 1
[![Part1](https://img.youtube.com/vi/x4_3irdV4C8/hqdefault.jpg)](https://www.youtube.com/watch?v=x4_3irdV4C8)

# Assembling R2 Uppity Spinner PCB Part 2
[![Part2](https://img.youtube.com/vi/MdSRJsYx1T8/hqdefault.jpg)](https://www.youtube.com/watch?v=MdSRJsYx1T8)

## Configure commands

`#PSC`:
Calibration routine. Will store results in EEPROM if successful
*Examples*:

    #PSC

`#PZERO`:
Erase all stored sequences from EEPROM
*Examples*:

    #PZERO

`#PL`:
List all stored sequences
*Examples*:

    #PL

`#PD`[number]:
Delete numbered sequence from EEPROM
*Examples*:

    #PD0 (delete sequence 0)

`#PS`[number]:seq
Store specified sequence (seq) as number in EEPROM.
*Examples*:

	#PS1:H                        (periscope down)
	#PS2:P100                     (periscope up)
	#PS3:P100:L5:R30              (search light counter-clockwise)
	#PS4:P100,100:L7:M,80,80,2,4  (random fast)
	#PS5:P100:L7:M,50,40,5,5      (random slow)
	#PS6:A0                       (face forward)
	#PS7:P100:L5:R-30             (search light clockwise)
	#PS8:H:P50:W2:P85,35:A90,25:W2:A270,20,100:W2:P100,100:L5:R50:W4:H    (sneaky periscope)
	#PS0:H:L0:P100,5:W2:P50:W2:P85,35:A90,25:W2:A270,20,100:W2:P100,100:L5:R50:W4:H

`#PBAUD`[baudrate]
Change system baudrate. Settings will be stored in EEPROM and take affect once the board is reset.
*Examples*:

	#PBAUD9600               (set baud rate to 9600)

`#PI2C`[address]
Change system I2C address. Settings will be stored in EEPROM and take affect once the board is reset.
*Examples*:

	#PI2C128                 (set I2C address to 128)

`#PR`
Enable/disable rotary unit. This will reboot the board. The setting will persist between reboots.
*Examples*:

	#PR (toggle rotary unit on/off)

`#PNCL`
Set lifter limit switch to normally closed. Default setting.
*Examples*:

	#PNCL (lifter limit normally closed)

`#PNOL`
Set lifter limit switch to normally open.
*Examples*:

	#PNOL (lifter limit normally open)

`#PNCR`
Set rotary limit switch to normally closed. Default setting.
*Examples*:

	#PNCL (rotary limit normally closed)

`#PNOR`
Set rotary limit switch to normally open.
*Examples*:

	#PNOR (rotary limit normally open)

Lifter commands
===============

A lifter command starts with ':P' followed by one of the these. Multiple commands can be issued seperated by a colon. Only the first command needs to be prefixed with 'P':

	:PP100:W2:P0

Would raise the periscope. Wait 2 seconds. Lower the periscope. Separately the commnads would be:

	:PP100
	:PW2
	:PP0

### Play stored sequence

`S`[number]:
Sequences can be stored using #PS
*Examples*:

    #PS0:H:L0:P100,5:W2:P50,25:W2:P85,35:A90,20:W2:A270,20,100:W2:P100,100:L5:R50:W4:H

### Wait number of seconds
`W`[R]seconds:
Wait for specified number of seconds. If 'R' is specified it will randomize the wait time in the range of 1..seconds. 'seconds' is a number between 1 and 600.
*Examples*:

	:PW2    (wait 2 seconds before executing next sequence)
	:PWR    (wait random 1-6 seconds)
	:PWR10  (wait random 1-10 seconds)

### Light kit sequence
`L`number:
Light kit sequence where number is in the range 0..7

`0`: Full Cycle (default): This routine will randomly select the LED color, pattern, and speed for a random period of time.
    
`1`: Off: This setting turns ALL lights OFF. I added this to allow a microcontroller to turn off the lights without having to kill the supply power.
    
`2`: Obi Wan: The Top LED’s flash Blue, the Side LED’s are Blue, and the Main White LED’s are Random.
    
`3`: Yoda: The Top LED’s and Side LED’s fade Green On and Off.
    
`4`: Sith: The Top LED’s and Side LED’s flash Red.
    
`5`: Search Light: All LED’s are White, the Center Bright LED is ON.
    
`6`: Dagobah: This is the most screen accurate mode. The Main White LED’s are ON, the side LED’s are White, the Lower  Rectangular Red LED’s are All On, and the Rear LED’s are Blinking Red.
    
`7`: Sparkle: All White LED’s randomly Flash
    
*Examples*:

    :PL0    (full cycle)
    :PL1    (off)

### Home
`H`[speed]:
Rotates the periscope into the home position and lowers the lifter. Will retry once if rotary ends up not in home position.
*Examples*:

	:PH     (go home at minimum power)
	:PH50   (go home at 50% speed)
	:PH100  (go home at 100% speed)

### Rotate scope relative degrees
`D`[R]:
Rotate scope random relative degrees
*Examples*:

	:PDR

`D`[degrees]:
Rotate scope relative degrees positive for counter clockwise and negative for clockwise
*Examples*:

	:PD90       (rotate periscope relative 90 degrees counter clockwise)
	:PD-90      (rotate periscope relative 90 degrees clockwise)

### Rotate scope absolute degrees
`A`[R][,speed][,maxspeed]:
Rotate scope random absolute degrees
*Examples*:

	:PAR

`A`[degrees][,speed][,maxspeed]:
Rotate scope to absolute position degrees. Positive for clockwise and negative for counter clockwise. Optionally specify the speed percentage and maximum speed percentage. By default the speed used is minimum rotary power (20%). The maximum speed defaults to the same value as speed if omitted.
*Examples*:

	:PA90        (rotate periscope to 90 degrees clockwise)
	:PA270       (rotate periscope to 270 degrees clockwise)
	:PA-90       (rotate periscope to 270 degrees clockwise)
	:PA0         (rotate periscope to home position)
	:PA90,20,100 (rotate periscope to 90 degrees starting at 20% speed increasing to 100%)
	             (will mostly likely overshoot target)

### Rotate scope continously
`R`[speed]:
Spin rotary scope at specified speed percentage
*Examples*:

	:PR30       (spin periscope at 30% speed counter clockwise)
	:PR-30      (spin periscope at 30% speed clockwise)

`R`[,speed]:
Lift periscope to random position.
*Examples*:

	:PPR        (random position)
	:PPR,50     (random position at 50% speed)

### Raise/lower periscope
`P`[position][,speed]:
Lift periscope to specified position percentage.
*Examples*:

	:PP100      (raise periscope fully)
	:PP0        (lower periscope fully)
	:PP50       (raise periscope halfway)
	:PP100,100  (raise periscope fully at maximum speed)

### Movement Random Continous
`M`,lifterspeed][,rotaryspeed][,mininterval][,maxinterval]:
Animate periscope continously rotate/lift.
*Examples*:

	:M,80,80,2,4  (animate lifter 80% power, rotatary random(20%-80%), minimum interval 2 seconds for a duration of 2+random(4) seconds )
	:M,50,40,5,5  (animate lifter 50% power, rotatary random(20%-40%) power, 80% minimum interval 5 seconds for a duration of 5+5 seconds )
