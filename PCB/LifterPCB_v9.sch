<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.7.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="16" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="17" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="18" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="19" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="25" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="26" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="27" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="28" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="29" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="30" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="20" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="21" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="22" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="23" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="7" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="Connector">
<description>&lt;b&gt;Pin Headers,Terminal blocks, D-Sub, Backplane, FFC/FPC, Socket</description>
<packages>
<package name="2X05" urn="urn:adsk.eagle:footprint:22358/1">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-6.35" y1="-1.905" x2="-5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-2.54" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-2.54" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-2.54" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-2.54" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-1.905" x2="-6.35" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="1.905" x2="-5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="2.54" x2="-4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="2.54" x2="-3.81" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="1.905" x2="-3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="2.54" x2="-1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-1.27" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="2.54" x2="0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="2.54" x2="1.27" y2="1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.905" x2="1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="2.54" x2="3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="2.54" x2="3.81" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="1.905" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-2.54" x2="3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-2.54" x2="0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-2.54" x2="-1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-2.54" x2="-4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-2.54" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.905" x2="4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="4.445" y1="2.54" x2="5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="2.54" x2="6.35" y2="1.905" width="0.1524" layer="21"/>
<wire x1="6.35" y1="1.905" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-2.54" x2="5.715" y2="-2.54" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="2" x="-5.08" y="1.27" drill="1.016" shape="octagon"/>
<pad name="3" x="-2.54" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="4" x="-2.54" y="1.27" drill="1.016" shape="octagon"/>
<pad name="5" x="0" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="6" x="0" y="1.27" drill="1.016" shape="octagon"/>
<pad name="7" x="2.54" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="8" x="2.54" y="1.27" drill="1.016" shape="octagon"/>
<pad name="9" x="5.08" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="10" x="5.08" y="1.27" drill="1.016" shape="octagon"/>
<text x="-6.35" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.35" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-5.334" y1="-1.524" x2="-4.826" y2="-1.016" layer="51"/>
<rectangle x1="-5.334" y1="1.016" x2="-4.826" y2="1.524" layer="51"/>
<rectangle x1="-2.794" y1="1.016" x2="-2.286" y2="1.524" layer="51"/>
<rectangle x1="-2.794" y1="-1.524" x2="-2.286" y2="-1.016" layer="51"/>
<rectangle x1="-0.254" y1="1.016" x2="0.254" y2="1.524" layer="51"/>
<rectangle x1="-0.254" y1="-1.524" x2="0.254" y2="-1.016" layer="51"/>
<rectangle x1="2.286" y1="1.016" x2="2.794" y2="1.524" layer="51"/>
<rectangle x1="2.286" y1="-1.524" x2="2.794" y2="-1.016" layer="51"/>
<rectangle x1="4.826" y1="1.016" x2="5.334" y2="1.524" layer="51"/>
<rectangle x1="4.826" y1="-1.524" x2="5.334" y2="-1.016" layer="51"/>
</package>
<package name="2X05/90" urn="urn:adsk.eagle:footprint:22359/1">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-6.35" y1="-1.905" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="6.985" x2="-5.08" y2="1.27" width="0.762" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="6.985" x2="-2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="6.985" x2="0" y2="1.27" width="0.762" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="6.985" x2="2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-1.905" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="6.985" x2="5.08" y2="1.27" width="0.762" layer="21"/>
<pad name="2" x="-5.08" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="4" x="-2.54" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="6" x="0" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="8" x="2.54" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="10" x="5.08" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="1" x="-5.08" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="3" x="-2.54" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="5" x="0" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="7" x="2.54" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="9" x="5.08" y="-6.35" drill="1.016" shape="octagon"/>
<text x="-6.985" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="8.255" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-5.461" y1="0.635" x2="-4.699" y2="1.143" layer="21"/>
<rectangle x1="-2.921" y1="0.635" x2="-2.159" y2="1.143" layer="21"/>
<rectangle x1="-0.381" y1="0.635" x2="0.381" y2="1.143" layer="21"/>
<rectangle x1="2.159" y1="0.635" x2="2.921" y2="1.143" layer="21"/>
<rectangle x1="4.699" y1="0.635" x2="5.461" y2="1.143" layer="21"/>
<rectangle x1="-5.461" y1="-2.921" x2="-4.699" y2="-1.905" layer="21"/>
<rectangle x1="-2.921" y1="-2.921" x2="-2.159" y2="-1.905" layer="21"/>
<rectangle x1="-5.461" y1="-5.461" x2="-4.699" y2="-4.699" layer="21"/>
<rectangle x1="-5.461" y1="-4.699" x2="-4.699" y2="-2.921" layer="51"/>
<rectangle x1="-2.921" y1="-4.699" x2="-2.159" y2="-2.921" layer="51"/>
<rectangle x1="-2.921" y1="-5.461" x2="-2.159" y2="-4.699" layer="21"/>
<rectangle x1="-0.381" y1="-2.921" x2="0.381" y2="-1.905" layer="21"/>
<rectangle x1="2.159" y1="-2.921" x2="2.921" y2="-1.905" layer="21"/>
<rectangle x1="-0.381" y1="-5.461" x2="0.381" y2="-4.699" layer="21"/>
<rectangle x1="-0.381" y1="-4.699" x2="0.381" y2="-2.921" layer="51"/>
<rectangle x1="2.159" y1="-4.699" x2="2.921" y2="-2.921" layer="51"/>
<rectangle x1="2.159" y1="-5.461" x2="2.921" y2="-4.699" layer="21"/>
<rectangle x1="4.699" y1="-2.921" x2="5.461" y2="-1.905" layer="21"/>
<rectangle x1="4.699" y1="-5.461" x2="5.461" y2="-4.699" layer="21"/>
<rectangle x1="4.699" y1="-4.699" x2="5.461" y2="-2.921" layer="51"/>
</package>
<package name="1X06" urn="urn:adsk.eagle:footprint:22361/1">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-0.635" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-1.27" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="1.27" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-1.27" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-7.6962" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-7.62" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
</package>
<package name="1X06/90" urn="urn:adsk.eagle:footprint:22362/1">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-7.62" y1="-1.905" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="6.985" x2="-6.35" y2="1.27" width="0.762" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="6.985" x2="6.35" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-6.35" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="6.35" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-8.255" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="9.525" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-6.731" y1="0.635" x2="-5.969" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="5.969" y1="0.635" x2="6.731" y2="1.143" layer="21"/>
<rectangle x1="-6.731" y1="-2.921" x2="-5.969" y2="-1.905" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
<rectangle x1="5.969" y1="-2.921" x2="6.731" y2="-1.905" layer="21"/>
</package>
<package name="2X02" urn="urn:adsk.eagle:footprint:22337/1">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-2.54" y1="-1.905" x2="-1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-2.54" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-2.54" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.905" x2="-1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="2.54" x2="0" y2="1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="1.905" x2="0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="2.54" x2="1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="2.54" x2="2.54" y2="1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-2.54" x2="1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-2.54" x2="-0.635" y2="-2.54" width="0.1524" layer="21"/>
<pad name="1" x="-1.27" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="2" x="-1.27" y="1.27" drill="1.016" shape="octagon"/>
<pad name="3" x="1.27" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="4" x="1.27" y="1.27" drill="1.016" shape="octagon"/>
<text x="-2.54" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.524" y1="-1.524" x2="-1.016" y2="-1.016" layer="51"/>
<rectangle x1="-1.524" y1="1.016" x2="-1.016" y2="1.524" layer="51"/>
<rectangle x1="1.016" y1="1.016" x2="1.524" y2="1.524" layer="51"/>
<rectangle x1="1.016" y1="-1.524" x2="1.524" y2="-1.016" layer="51"/>
</package>
<package name="2X02/90" urn="urn:adsk.eagle:footprint:22338/1">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<pad name="2" x="-1.27" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="4" x="1.27" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="1" x="-1.27" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="3" x="1.27" y="-6.35" drill="1.016" shape="octagon"/>
<text x="-3.175" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="4.445" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-5.461" x2="-0.889" y2="-4.699" layer="21"/>
<rectangle x1="-1.651" y1="-4.699" x2="-0.889" y2="-2.921" layer="51"/>
<rectangle x1="0.889" y1="-4.699" x2="1.651" y2="-2.921" layer="51"/>
<rectangle x1="0.889" y1="-5.461" x2="1.651" y2="-4.699" layer="21"/>
</package>
<package name="2X03" urn="urn:adsk.eagle:footprint:22348/1">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.81" y1="-1.905" x2="-3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-2.54" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-2.54" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.81" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="1.905" x2="-3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="2.54" x2="-1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-1.27" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="2.54" x2="0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="2.54" x2="1.27" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-2.54" x2="0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-2.54" x2="-1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-2.54" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.905" x2="1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="2.54" x2="3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="2.54" x2="3.81" y2="1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-2.54" x2="3.175" y2="-2.54" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="2" x="-2.54" y="1.27" drill="1.016" shape="octagon"/>
<pad name="3" x="0" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="4" x="0" y="1.27" drill="1.016" shape="octagon"/>
<pad name="5" x="2.54" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="6" x="2.54" y="1.27" drill="1.016" shape="octagon"/>
<text x="-3.81" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.794" y1="-1.524" x2="-2.286" y2="-1.016" layer="51"/>
<rectangle x1="-2.794" y1="1.016" x2="-2.286" y2="1.524" layer="51"/>
<rectangle x1="-0.254" y1="1.016" x2="0.254" y2="1.524" layer="51"/>
<rectangle x1="-0.254" y1="-1.524" x2="0.254" y2="-1.016" layer="51"/>
<rectangle x1="2.286" y1="1.016" x2="2.794" y2="1.524" layer="51"/>
<rectangle x1="2.286" y1="-1.524" x2="2.794" y2="-1.016" layer="51"/>
</package>
<package name="2X03/90" urn="urn:adsk.eagle:footprint:22349/1">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="6.985" x2="-2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="6.985" x2="0" y2="1.27" width="0.762" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="6.985" x2="2.54" y2="1.27" width="0.762" layer="21"/>
<pad name="2" x="-2.54" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="4" x="0" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="6" x="2.54" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="1" x="-2.54" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="3" x="0" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="5" x="2.54" y="-6.35" drill="1.016" shape="octagon"/>
<text x="-4.445" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="5.715" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.921" y1="0.635" x2="-2.159" y2="1.143" layer="21"/>
<rectangle x1="-0.381" y1="0.635" x2="0.381" y2="1.143" layer="21"/>
<rectangle x1="2.159" y1="0.635" x2="2.921" y2="1.143" layer="21"/>
<rectangle x1="-2.921" y1="-2.921" x2="-2.159" y2="-1.905" layer="21"/>
<rectangle x1="-0.381" y1="-2.921" x2="0.381" y2="-1.905" layer="21"/>
<rectangle x1="-2.921" y1="-5.461" x2="-2.159" y2="-4.699" layer="21"/>
<rectangle x1="-2.921" y1="-4.699" x2="-2.159" y2="-2.921" layer="51"/>
<rectangle x1="-0.381" y1="-4.699" x2="0.381" y2="-2.921" layer="51"/>
<rectangle x1="-0.381" y1="-5.461" x2="0.381" y2="-4.699" layer="21"/>
<rectangle x1="2.159" y1="-2.921" x2="2.921" y2="-1.905" layer="21"/>
<rectangle x1="2.159" y1="-5.461" x2="2.921" y2="-4.699" layer="21"/>
<rectangle x1="2.159" y1="-4.699" x2="2.921" y2="-2.921" layer="51"/>
</package>
</packages>
<packages3d>
<package3d name="2X05" urn="urn:adsk.eagle:package:22470/2" type="model">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="2X05"/>
</packageinstances>
</package3d>
<package3d name="2X05/90" urn="urn:adsk.eagle:package:22471/2" type="model">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="2X05/90"/>
</packageinstances>
</package3d>
<package3d name="1X06" urn="urn:adsk.eagle:package:22472/2" type="model">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X06"/>
</packageinstances>
</package3d>
<package3d name="1X06/90" urn="urn:adsk.eagle:package:22475/2" type="model">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X06/90"/>
</packageinstances>
</package3d>
<package3d name="2X02" urn="urn:adsk.eagle:package:22455/2" type="model">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="2X02"/>
</packageinstances>
</package3d>
<package3d name="2X02/90" urn="urn:adsk.eagle:package:22456/2" type="model">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="2X02/90"/>
</packageinstances>
</package3d>
<package3d name="2X03" urn="urn:adsk.eagle:package:22462/2" type="model">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="2X03"/>
</packageinstances>
</package3d>
<package3d name="2X03/90" urn="urn:adsk.eagle:package:22464/2" type="model">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="2X03/90"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="PINH2X5" urn="urn:adsk.eagle:symbol:22357/1">
<wire x1="-6.35" y1="-7.62" x2="8.89" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="8.89" y1="-7.62" x2="8.89" y2="7.62" width="0.4064" layer="94"/>
<wire x1="8.89" y1="7.62" x2="-6.35" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-7.62" width="0.4064" layer="94"/>
<text x="-6.35" y="8.255" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="5.08" y="5.08" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="3" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="5.08" y="2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="5" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="5.08" y="0" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="7" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="8" x="5.08" y="-2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="9" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="10" x="5.08" y="-5.08" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
</symbol>
<symbol name="PINHD6" urn="urn:adsk.eagle:symbol:22360/1">
<wire x1="-6.35" y1="-7.62" x2="1.27" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-7.62" x2="1.27" y2="10.16" width="0.4064" layer="94"/>
<wire x1="1.27" y1="10.16" x2="-6.35" y2="10.16" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="10.16" x2="-6.35" y2="-7.62" width="0.4064" layer="94"/>
<text x="-6.35" y="10.795" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINH2X2" urn="urn:adsk.eagle:symbol:22336/1">
<wire x1="-8.89" y1="-2.54" x2="6.35" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="6.35" y1="-2.54" x2="6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="6.35" y1="5.08" x2="-8.89" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-8.89" y1="5.08" x2="-8.89" y2="-2.54" width="0.4064" layer="94"/>
<text x="-8.89" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-8.89" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="3" x="-5.08" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="2.54" y="0" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
</symbol>
<symbol name="PINH2X3" urn="urn:adsk.eagle:symbol:22347/1">
<wire x1="-6.35" y1="-5.08" x2="8.89" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="8.89" y1="-5.08" x2="8.89" y2="5.08" width="0.4064" layer="94"/>
<wire x1="8.89" y1="5.08" x2="-6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="5.08" y="2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="3" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="5.08" y="0" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="5" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="5.08" y="-2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-2X5" urn="urn:adsk.eagle:component:16494873/2" prefix="JP">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINH2X5" x="0" y="0"/>
</gates>
<devices>
<device name="" package="2X05">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22470/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="CONNECTOR" constant="no"/>
<attribute name="DESCRIPTION" value="" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="PIN-HEADER" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="/90" package="2X05/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22471/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="CONNECTOR" constant="no"/>
<attribute name="DESCRIPTION" value="" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="PIN-HEADER" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X6" urn="urn:adsk.eagle:component:16494859/2" prefix="JP">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD6" x="0" y="-2.54"/>
</gates>
<devices>
<device name="" package="1X06">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22472/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="CONNECTOR" constant="no"/>
<attribute name="DESCRIPTION" value="" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="PIN-HEADER" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="/90" package="1X06/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22475/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="CONNECTOR" constant="no"/>
<attribute name="DESCRIPTION" value="" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="PIN-HEADER" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-2X2" urn="urn:adsk.eagle:component:16494872/2" prefix="JP">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINH2X2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="2X02">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22455/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="CONNECTOR" constant="no"/>
<attribute name="DESCRIPTION" value="" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="PIN-HEADER" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="/90" package="2X02/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22456/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="CONNECTOR" constant="no"/>
<attribute name="DESCRIPTION" value="" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="PIN-HEADER" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-2X3" urn="urn:adsk.eagle:component:16494865/2" prefix="JP">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINH2X3" x="0" y="0"/>
</gates>
<devices>
<device name="" package="2X03">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22462/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="CONNECTOR" constant="no"/>
<attribute name="DESCRIPTION" value="" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="PIN-HEADER" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="/90" package="2X03/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22464/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="CONNECTOR" constant="no"/>
<attribute name="DESCRIPTION" value="" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="PIN-HEADER" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Power_Symbols">
<description>&lt;B&gt;Supply &amp; Ground symbols</description>
<packages>
</packages>
<symbols>
<symbol name="GND" urn="urn:adsk.eagle:symbol:16502380/2">
<description>Ground (GND) Arrow</description>
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="0" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0" y1="-1.27" x2="-1.27" y2="0" width="0.254" layer="94"/>
<text x="0" y="-2.54" size="1.778" layer="96" align="center">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="+5V" urn="urn:adsk.eagle:symbol:18498226/2">
<description>5 Volt (5V0) Bar</description>
<wire x1="1.905" y1="2.54" x2="-1.905" y2="2.54" width="0.254" layer="94"/>
<text x="-0.127" y="3.048" size="1.778" layer="96" align="bottom-center">&gt;VALUE</text>
<pin name="+5V" x="0" y="0" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="+12V" urn="urn:adsk.eagle:symbol:18498246/2">
<description>12 Volt (12V) Bar</description>
<wire x1="1.905" y1="2.54" x2="-1.905" y2="2.54" width="0.254" layer="94"/>
<text x="-0.127" y="3.048" size="1.778" layer="96" align="bottom-center">&gt;VALUE</text>
<pin name="+12V" x="0" y="0" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" urn="urn:adsk.eagle:component:16502425/4" prefix="SUPPLY">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt; - Ground (GND) Arrow</description>
<gates>
<gate name="G$1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="CATEGORY" value="Supply" constant="no"/>
<attribute name="VALUE" value="GND" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+5V" urn="urn:adsk.eagle:component:16502432/6" prefix="SUPPLY">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;  5 Volt (5V0) Bar</description>
<gates>
<gate name="G$1" symbol="+5V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="CATEGORY" value="Supply" constant="no"/>
<attribute name="VALUE" value="+5V" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+12V" urn="urn:adsk.eagle:component:16502434/6" prefix="SUPPLY">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt; 12 Volt (12V) Bar</description>
<gates>
<gate name="G$1" symbol="+12V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="CATEGORY" value="Supply" constant="no"/>
<attribute name="VALUE" value="+12V" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Pololu" urn="urn:adsk.wipprod:fs.file:vf.Ql7qiByFRWGqrDqtTfiOKQ">
<packages>
<package name="POLOLU3161">
<pad name="9" x="-7.62" y="-16.51" drill="1.02"/>
<pad name="10" x="-5.08" y="-16.51" drill="1.02"/>
<pad name="11$1" x="-2.54" y="-16.51" drill="1.02"/>
<pad name="12$1" x="0" y="-16.51" drill="1.02"/>
<pad name="22" x="2.54" y="-16.51" drill="1.02"/>
<pad name="23" x="5.08" y="-16.51" drill="1.02"/>
<pad name="13$1" x="7.62" y="-16.51" drill="1.02"/>
<pad name="8" x="-7.62" y="-13.97" drill="1.02"/>
<pad name="7" x="-7.62" y="-11.43" drill="1.02"/>
<pad name="6" x="-7.62" y="-8.89" drill="1.02"/>
<pad name="5" x="-7.62" y="-6.35" drill="1.02"/>
<pad name="4" x="-7.62" y="-3.81" drill="1.02"/>
<pad name="3" x="-7.62" y="-1.27" drill="1.02"/>
<pad name="2" x="-7.62" y="1.27" drill="1.02"/>
<pad name="TXD0_2" x="-7.62" y="3.81" drill="1.02"/>
<pad name="RXD0_2" x="-7.62" y="6.35" drill="1.02"/>
<pad name="RESET1" x="-7.62" y="8.89" drill="1.02"/>
<pad name="GND3" x="-7.62" y="11.43" drill="1.02" shape="square"/>
<pad name="14" x="7.62" y="-13.97" drill="1.02"/>
<pad name="15" x="7.62" y="-11.43" drill="1.02"/>
<pad name="16" x="7.62" y="-8.89" drill="1.02"/>
<pad name="17" x="7.62" y="-6.35" drill="1.02"/>
<pad name="18" x="7.62" y="-3.81" drill="1.02"/>
<pad name="19" x="7.62" y="-1.27" drill="1.02"/>
<pad name="20" x="7.62" y="1.27" drill="1.02"/>
<pad name="21" x="7.62" y="3.81" drill="1.02"/>
<pad name="VCC2" x="7.62" y="6.35" drill="1.02"/>
<pad name="GND5" x="7.62" y="8.89" drill="1.02" shape="square"/>
<pad name="BAT+" x="7.62" y="11.43" drill="1.02"/>
<pad name="GND1" x="-6.35" y="13.97" drill="1.02" shape="square"/>
<pad name="GND2" x="-3.81" y="13.97" drill="1.02" shape="square"/>
<pad name="VCCIN" x="-1.27" y="13.97" drill="1.02"/>
<pad name="RXD0_1" x="1.27" y="13.97" drill="1.02"/>
<pad name="TXD0_1" x="3.81" y="13.97" drill="1.02"/>
<pad name="DTR" x="6.35" y="13.97" drill="1.02"/>
<pad name="VIN" x="5.08" y="11.43" drill="1.02"/>
<pad name="GND4" x="5.08" y="8.89" drill="1.02" shape="square"/>
<pad name="VCC1" x="5.08" y="6.35" drill="1.02"/>
<pad name="AREF" x="5.08" y="3.81" drill="1.02"/>
<pad name="12$2" x="-2.54" y="-11.43" drill="1.02"/>
<pad name="13$2" x="0" y="-11.43" drill="1.02"/>
<pad name="RESET2" x="2.54" y="-11.43" drill="1.02"/>
<pad name="VCC3" x="-2.54" y="-8.89" drill="1.02"/>
<pad name="11$2" x="0" y="-8.89" drill="1.02"/>
<pad name="GND6" x="2.54" y="-8.89" drill="1.02" shape="square"/>
<wire x1="-8.89" y1="15.24" x2="8.89" y2="15.24" width="0.127" layer="21"/>
<wire x1="8.89" y1="15.24" x2="8.89" y2="-17.78" width="0.127" layer="21"/>
<wire x1="8.89" y1="-17.78" x2="-8.89" y2="-17.78" width="0.127" layer="21"/>
<wire x1="-8.89" y1="-17.78" x2="-8.89" y2="15.24" width="0.127" layer="21"/>
</package>
<package name="1213">
<pad name="GND" x="-12.7" y="-19.05" drill="1.02" shape="square"/>
<pad name="GND$2" x="-10.16" y="-6.35" drill="1.02" shape="square"/>
<pad name="VDD$5" x="-10.16" y="-8.89" drill="1.02"/>
<pad name="VDD$4" x="-10.16" y="1.27" drill="1.02"/>
<pad name="VDD$3" x="-10.16" y="3.81" drill="1.02"/>
<pad name="GND$1" x="-10.16" y="16.51" drill="1.02" shape="square"/>
<pad name="VDD$1" x="-10.16" y="13.97" drill="1.02"/>
<pad name="M2FB" x="-12.7" y="21.59" drill="1.02"/>
<pad name="M2SF" x="-12.7" y="19.05" drill="1.02"/>
<pad name="M2PWM1" x="-12.7" y="16.51" drill="1.02"/>
<pad name="M2PWM2" x="-12.7" y="13.97" drill="1.02"/>
<pad name="M2IN1" x="-12.7" y="11.43" drill="1.02"/>
<pad name="M2IN2" x="-12.7" y="8.89" drill="1.02"/>
<pad name="INV" x="-12.7" y="6.35" drill="1.02"/>
<pad name="SLEW" x="-12.7" y="3.81" drill="1.02"/>
<pad name="EN" x="-12.7" y="1.27" drill="1.02"/>
<pad name="M1FB" x="-12.7" y="-1.27" drill="1.02"/>
<pad name="M1SF" x="-12.7" y="-3.81" drill="1.02"/>
<pad name="M1PWM1" x="-12.7" y="-6.35" drill="1.02"/>
<pad name="M1PWM2" x="-12.7" y="-8.89" drill="1.02"/>
<pad name="M1IN1" x="-12.7" y="-11.43" drill="1.02"/>
<pad name="M1IN2" x="-12.7" y="-13.97" drill="1.02"/>
<pad name="VDD" x="-12.7" y="-16.51" drill="1.02"/>
<pad name="VIN" x="-12.7" y="-21.59" drill="1.02"/>
<wire x1="-13.97" y1="-22.86" x2="-13.97" y2="22.86" width="0.254" layer="21"/>
<wire x1="-13.97" y1="22.86" x2="13.97" y2="22.86" width="0.254" layer="21"/>
<wire x1="-13.97" y1="-22.86" x2="13.97" y2="-22.86" width="0.254" layer="21"/>
<wire x1="13.97" y1="-22.86" x2="13.97" y2="22.86" width="0.254" layer="21"/>
<pad name="VDD$2" x="-10.16" y="6.35" drill="1.02"/>
<pad name="M1OUT1" x="10.3378" y="-9.2202" drill="1.52"/>
<pad name="M1OUT2" x="10.3378" y="-5.715" drill="1.52"/>
<pad name="MGND" x="10.3378" y="-2.286" drill="1.52" shape="square"/>
<pad name="MVIN" x="10.3378" y="1.2192" drill="1.52"/>
<pad name="M2OUT1" x="10.3378" y="4.7498" drill="1.52"/>
<pad name="M2OUT2" x="10.3378" y="8.255" drill="1.52"/>
<hole x="11.43" y="20.32" drill="2.18"/>
<hole x="11.43" y="-20.32" drill="2.18"/>
</package>
</packages>
<symbols>
<symbol name="328PB" library_version="22">
<pin name="DTR" x="17.78" y="53.34" visible="pin" length="middle" direction="in" rot="R270"/>
<pin name="TXD0_1" x="15.24" y="53.34" visible="pin" length="middle" direction="in" rot="R270"/>
<pin name="RXDO_1" x="12.7" y="53.34" visible="pin" length="middle" direction="in" rot="R270"/>
<pin name="VCCIN" x="10.16" y="53.34" visible="pin" length="middle" direction="in" rot="R270"/>
<pin name="GND1" x="7.62" y="53.34" visible="pin" length="middle" direction="in" rot="R270"/>
<pin name="GND2" x="5.08" y="53.34" visible="pin" length="middle" direction="in" rot="R270"/>
<pin name="GND" x="-10.16" y="33.02" visible="pin" length="middle" direction="in"/>
<pin name="RESET" x="-10.16" y="30.48" visible="pin" length="middle" direction="in"/>
<pin name="RXD0" x="-10.16" y="27.94" visible="pin" length="middle" direction="in"/>
<pin name="TXD0" x="-10.16" y="25.4" visible="pin" length="middle" direction="in"/>
<pin name="2" x="-10.16" y="22.86" visible="pin" length="middle" direction="in"/>
<pin name="3" x="-10.16" y="20.32" visible="pin" length="middle" direction="in"/>
<pin name="4" x="-10.16" y="17.78" visible="pin" length="middle" direction="in"/>
<pin name="5" x="-10.16" y="15.24" visible="pin" length="middle" direction="in"/>
<pin name="6" x="-10.16" y="12.7" visible="pin" length="middle" direction="in"/>
<pin name="7" x="-10.16" y="10.16" visible="pin" length="middle" direction="in"/>
<pin name="8" x="-10.16" y="7.62" visible="pin" length="middle" direction="in"/>
<pin name="9" x="-10.16" y="5.08" visible="pin" length="middle" direction="in"/>
<pin name="13" x="33.02" y="5.08" visible="pin" length="middle" direction="in" rot="R180"/>
<pin name="14" x="33.02" y="7.62" visible="pin" length="middle" direction="in" rot="R180"/>
<pin name="15" x="33.02" y="10.16" visible="pin" length="middle" direction="in" rot="R180"/>
<pin name="16" x="33.02" y="12.7" visible="pin" length="middle" direction="in" rot="R180"/>
<pin name="17" x="33.02" y="15.24" visible="pin" length="middle" direction="in" rot="R180"/>
<pin name="18" x="33.02" y="17.78" visible="pin" length="middle" direction="in" rot="R180"/>
<pin name="19" x="33.02" y="20.32" visible="pin" length="middle" direction="in" rot="R180"/>
<pin name="20" x="33.02" y="22.86" visible="pin" length="middle" direction="in" rot="R180"/>
<pin name="21" x="33.02" y="25.4" visible="pin" length="middle" direction="in" rot="R180"/>
<pin name="VCC2" x="33.02" y="27.94" visible="pin" length="middle" direction="in" rot="R180"/>
<pin name="GND4" x="33.02" y="30.48" visible="pin" length="middle" direction="in" rot="R180"/>
<pin name="BAT+" x="33.02" y="33.02" visible="pin" length="middle" direction="in" rot="R180"/>
<pin name="AREF" x="15.24" y="25.4" visible="pin" length="point" direction="in" rot="R180"/>
<pin name="VCC1" x="15.24" y="27.94" visible="pin" length="point" direction="in" rot="R180"/>
<pin name="GND3" x="15.24" y="30.48" visible="pin" length="point" direction="in" rot="R180"/>
<pin name="VIN" x="15.24" y="33.02" visible="pin" length="point" direction="in" rot="R180"/>
<pin name="10" x="7.62" y="-10.16" visible="pin" length="middle" direction="in" rot="R90"/>
<pin name="11" x="10.16" y="-10.16" visible="pin" length="middle" direction="in" rot="R90"/>
<pin name="12" x="12.7" y="-10.16" visible="pin" length="middle" direction="in" rot="R90"/>
<pin name="22" x="15.24" y="-10.16" visible="pin" length="middle" direction="in" rot="R90"/>
<pin name="23" x="17.78" y="-10.16" visible="pin" length="middle" direction="in" rot="R90"/>
<pin name="MISO" x="5.08" y="12.7" visible="pin" length="point" direction="in" rot="R270"/>
<pin name="VCC3" x="5.08" y="15.24" visible="pin" length="point" direction="in" rot="R90"/>
<pin name="MOSI" x="7.62" y="15.24" visible="pin" length="point" direction="in" rot="R90"/>
<pin name="GND5" x="10.16" y="15.24" visible="pin" length="point" direction="in" rot="R90"/>
<pin name="RESET2" x="10.16" y="12.7" visible="pin" length="point" direction="in" rot="R270"/>
<pin name="SCK" x="7.62" y="12.7" visible="pin" length="point" direction="in" rot="R270"/>
<wire x1="-5.08" y1="-7.62" x2="-5.08" y2="50.8" width="0.254" layer="94"/>
<wire x1="-5.08" y1="50.8" x2="30.48" y2="50.8" width="0.254" layer="94"/>
<wire x1="30.48" y1="50.8" x2="30.48" y2="-7.62" width="0.254" layer="94"/>
<wire x1="30.48" y1="-7.62" x2="-5.08" y2="-7.62" width="0.254" layer="94"/>
<text x="17.78" y="2.54" size="1.27" layer="94" rot="R90">A-Star 328PB Micro</text>
</symbol>
<symbol name="1213">
<wire x1="-17.78" y1="25.4" x2="-17.78" y2="-30.48" width="0.254" layer="94"/>
<wire x1="-17.78" y1="-30.48" x2="17.78" y2="-30.48" width="0.254" layer="94"/>
<wire x1="17.78" y1="-30.48" x2="17.78" y2="25.4" width="0.254" layer="94"/>
<wire x1="17.78" y1="25.4" x2="-17.78" y2="25.4" width="0.254" layer="94"/>
<text x="-17.78" y="26.289" size="1.778" layer="95">&gt;NAME</text>
<text x="-17.78" y="-33.02" size="1.778" layer="96">&gt;VALUE</text>
<pin name="VIN" x="-22.86" y="17.78" visible="pin" length="middle" direction="in"/>
<pin name="GND" x="22.86" y="-27.94" visible="pin" length="middle" direction="pwr" rot="R180"/>
<pin name="VDD" x="22.86" y="22.86" visible="pin" length="middle" direction="pwr" rot="R180"/>
<pin name="M1IN2" x="-22.86" y="7.62" visible="pin" length="middle" direction="in"/>
<pin name="M1IN1" x="-22.86" y="10.16" visible="pin" length="middle" direction="in"/>
<pin name="M1_PWM/!D2" x="-22.86" y="-7.62" visible="pin" length="middle" direction="in"/>
<pin name="M1_!PWM!/D1" x="-22.86" y="-5.08" visible="pin" length="middle" direction="in"/>
<pin name="M1!SF" x="22.86" y="-5.08" visible="pin" length="middle" direction="out" rot="R180"/>
<pin name="M1FB" x="22.86" y="-7.62" visible="pin" length="middle" direction="out" rot="R180"/>
<pin name="EN" x="-22.86" y="-20.32" visible="pin" length="middle" direction="in"/>
<pin name="SLEW" x="-22.86" y="-22.86" visible="pin" length="middle" direction="in"/>
<pin name="INV" x="-22.86" y="-25.4" visible="pin" length="middle" direction="in"/>
<pin name="M2IN2" x="-22.86" y="0" visible="pin" length="middle" direction="in"/>
<pin name="M2IN1" x="-22.86" y="2.54" visible="pin" length="middle" direction="in"/>
<pin name="M2_PWM/!D2" x="-22.86" y="-15.24" visible="pin" length="middle" direction="in"/>
<pin name="M2_!PWM!/D1" x="-22.86" y="-12.7" visible="pin" length="middle" direction="in"/>
<pin name="M2!SF" x="22.86" y="-12.7" visible="pin" length="middle" direction="out" rot="R180"/>
<pin name="M2FB" x="22.86" y="-15.24" visible="pin" length="middle" direction="out" rot="R180"/>
<pin name="VIN(5-28V)" x="-22.86" y="15.24" visible="pin" length="middle" direction="in"/>
<pin name="M1OUT1" x="22.86" y="10.16" visible="pin" length="middle" direction="out" rot="R180"/>
<pin name="M1OUT2" x="22.86" y="7.62" visible="pin" length="middle" direction="out" rot="R180"/>
<pin name="M2OUT1" x="22.86" y="2.54" visible="pin" length="middle" direction="out" rot="R180"/>
<pin name="M2OUT2" x="22.86" y="0" visible="pin" length="middle" direction="out" rot="R180"/>
<text x="2.54" y="-15.24" size="1.778" layer="94" rot="R90">Dual MC33926 Motor Driver</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="POLOLU3161">
<gates>
<gate name="G$1" symbol="328PB" x="0" y="-7.62"/>
</gates>
<devices>
<device name="" package="POLOLU3161">
<connects>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="11" pad="11$1"/>
<connect gate="G$1" pin="12" pad="12$1"/>
<connect gate="G$1" pin="13" pad="13$1"/>
<connect gate="G$1" pin="14" pad="14"/>
<connect gate="G$1" pin="15" pad="15"/>
<connect gate="G$1" pin="16" pad="16"/>
<connect gate="G$1" pin="17" pad="17"/>
<connect gate="G$1" pin="18" pad="18"/>
<connect gate="G$1" pin="19" pad="19"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="20" pad="20"/>
<connect gate="G$1" pin="21" pad="21"/>
<connect gate="G$1" pin="22" pad="22"/>
<connect gate="G$1" pin="23" pad="23"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
<connect gate="G$1" pin="AREF" pad="AREF"/>
<connect gate="G$1" pin="BAT+" pad="BAT+"/>
<connect gate="G$1" pin="DTR" pad="DTR"/>
<connect gate="G$1" pin="GND" pad="GND6"/>
<connect gate="G$1" pin="GND1" pad="GND5"/>
<connect gate="G$1" pin="GND2" pad="GND4"/>
<connect gate="G$1" pin="GND3" pad="GND3"/>
<connect gate="G$1" pin="GND4" pad="GND2"/>
<connect gate="G$1" pin="GND5" pad="GND1"/>
<connect gate="G$1" pin="MISO" pad="12$2"/>
<connect gate="G$1" pin="MOSI" pad="11$2"/>
<connect gate="G$1" pin="RESET" pad="RESET2"/>
<connect gate="G$1" pin="RESET2" pad="RESET1"/>
<connect gate="G$1" pin="RXD0" pad="RXD0_1"/>
<connect gate="G$1" pin="RXDO_1" pad="RXD0_2"/>
<connect gate="G$1" pin="SCK" pad="13$2"/>
<connect gate="G$1" pin="TXD0" pad="TXD0_1"/>
<connect gate="G$1" pin="TXD0_1" pad="TXD0_2"/>
<connect gate="G$1" pin="VCC1" pad="VCC1"/>
<connect gate="G$1" pin="VCC2" pad="VCC2"/>
<connect gate="G$1" pin="VCC3" pad="VCC3"/>
<connect gate="G$1" pin="VCCIN" pad="VCCIN"/>
<connect gate="G$1" pin="VIN" pad="VIN"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="1213">
<gates>
<gate name="G$1" symbol="1213" x="-2.54" y="2.54"/>
</gates>
<devices>
<device name="" package="1213">
<connects>
<connect gate="G$1" pin="EN" pad="EN"/>
<connect gate="G$1" pin="GND" pad="GND GND$1 GND$2 MGND"/>
<connect gate="G$1" pin="INV" pad="INV"/>
<connect gate="G$1" pin="M1!SF" pad="M1SF"/>
<connect gate="G$1" pin="M1FB" pad="M1FB"/>
<connect gate="G$1" pin="M1IN1" pad="M1IN1"/>
<connect gate="G$1" pin="M1IN2" pad="M1IN2"/>
<connect gate="G$1" pin="M1OUT1" pad="M1OUT1"/>
<connect gate="G$1" pin="M1OUT2" pad="M1OUT2"/>
<connect gate="G$1" pin="M1_!PWM!/D1" pad="M1PWM1"/>
<connect gate="G$1" pin="M1_PWM/!D2" pad="M1PWM2"/>
<connect gate="G$1" pin="M2!SF" pad="M2SF"/>
<connect gate="G$1" pin="M2FB" pad="M2FB"/>
<connect gate="G$1" pin="M2IN1" pad="M2IN1"/>
<connect gate="G$1" pin="M2IN2" pad="M2IN2"/>
<connect gate="G$1" pin="M2OUT1" pad="M2OUT1"/>
<connect gate="G$1" pin="M2OUT2" pad="M2OUT2"/>
<connect gate="G$1" pin="M2_!PWM!/D1" pad="M2PWM1"/>
<connect gate="G$1" pin="M2_PWM/!D2" pad="M2PWM2"/>
<connect gate="G$1" pin="SLEW" pad="SLEW"/>
<connect gate="G$1" pin="VDD" pad="VDD VDD$1 VDD$2 VDD$3 VDD$4 VDD$5"/>
<connect gate="G$1" pin="VIN" pad="VIN"/>
<connect gate="G$1" pin="VIN(5-28V)" pad="MVIN"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="frames" urn="urn:adsk.eagle:library:229">
<description>&lt;b&gt;Frames for Sheet and Layout&lt;/b&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="FRAME_A_L" urn="urn:adsk.eagle:symbol:13882/1" library_version="1">
<frame x1="0" y1="0" x2="279.4" y2="215.9" columns="6" rows="5" layer="94" border-bottom="no"/>
</symbol>
<symbol name="DOCFIELD" urn="urn:adsk.eagle:symbol:13864/1" library_version="1">
<wire x1="0" y1="0" x2="71.12" y2="0" width="0.1016" layer="94"/>
<wire x1="101.6" y1="15.24" x2="87.63" y2="15.24" width="0.1016" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="5.08" width="0.1016" layer="94"/>
<wire x1="0" y1="5.08" x2="71.12" y2="5.08" width="0.1016" layer="94"/>
<wire x1="0" y1="5.08" x2="0" y2="15.24" width="0.1016" layer="94"/>
<wire x1="101.6" y1="15.24" x2="101.6" y2="5.08" width="0.1016" layer="94"/>
<wire x1="71.12" y1="5.08" x2="71.12" y2="0" width="0.1016" layer="94"/>
<wire x1="71.12" y1="5.08" x2="87.63" y2="5.08" width="0.1016" layer="94"/>
<wire x1="71.12" y1="0" x2="101.6" y2="0" width="0.1016" layer="94"/>
<wire x1="87.63" y1="15.24" x2="87.63" y2="5.08" width="0.1016" layer="94"/>
<wire x1="87.63" y1="15.24" x2="0" y2="15.24" width="0.1016" layer="94"/>
<wire x1="87.63" y1="5.08" x2="101.6" y2="5.08" width="0.1016" layer="94"/>
<wire x1="101.6" y1="5.08" x2="101.6" y2="0" width="0.1016" layer="94"/>
<wire x1="0" y1="15.24" x2="0" y2="22.86" width="0.1016" layer="94"/>
<wire x1="101.6" y1="35.56" x2="0" y2="35.56" width="0.1016" layer="94"/>
<wire x1="101.6" y1="35.56" x2="101.6" y2="22.86" width="0.1016" layer="94"/>
<wire x1="0" y1="22.86" x2="101.6" y2="22.86" width="0.1016" layer="94"/>
<wire x1="0" y1="22.86" x2="0" y2="35.56" width="0.1016" layer="94"/>
<wire x1="101.6" y1="22.86" x2="101.6" y2="15.24" width="0.1016" layer="94"/>
<text x="1.27" y="1.27" size="2.54" layer="94">Date:</text>
<text x="12.7" y="1.27" size="2.54" layer="94">&gt;LAST_DATE_TIME</text>
<text x="72.39" y="1.27" size="2.54" layer="94">Sheet:</text>
<text x="86.36" y="1.27" size="2.54" layer="94">&gt;SHEET</text>
<text x="88.9" y="11.43" size="2.54" layer="94">REV:</text>
<text x="1.27" y="19.05" size="2.54" layer="94">TITLE:</text>
<text x="1.27" y="11.43" size="2.54" layer="94">Document Number:</text>
<text x="17.78" y="19.05" size="2.54" layer="94">&gt;DRAWING_NAME</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="FRAME_A_L" urn="urn:adsk.eagle:component:13939/1" prefix="FRAME" uservalue="yes" library_version="1">
<description>&lt;b&gt;FRAME&lt;/b&gt; A Size , 8 1/2 x 11 INCH, Landscape&lt;p&gt;</description>
<gates>
<gate name="G$1" symbol="FRAME_A_L" x="0" y="0" addlevel="always"/>
<gate name="G$2" symbol="DOCFIELD" x="172.72" y="0" addlevel="always"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="2851" urn="urn:adsk.wipprod:fs.file:vf.wwBf7lndQe-DmSn-aNIcHw">
<packages>
<package name="VREG_2851" library_version="1">
<wire x1="-10.15" y1="8.9" x2="10.15" y2="8.9" width="0.127" layer="51"/>
<wire x1="10.15" y1="8.9" x2="10.15" y2="-8.9" width="0.127" layer="51"/>
<wire x1="10.15" y1="-8.9" x2="-10.15" y2="-8.9" width="0.127" layer="51"/>
<wire x1="-10.15" y1="-8.9" x2="-10.15" y2="8.9" width="0.127" layer="51"/>
<wire x1="-10.15" y1="8.9" x2="10.15" y2="8.9" width="0.127" layer="21"/>
<wire x1="10.15" y1="8.9" x2="10.15" y2="-8.9" width="0.127" layer="21"/>
<wire x1="10.15" y1="-8.9" x2="-10.15" y2="-8.9" width="0.127" layer="21"/>
<wire x1="-10.15" y1="-8.9" x2="-10.15" y2="8.9" width="0.127" layer="21"/>
<wire x1="-10.4" y1="9.15" x2="10.4" y2="9.15" width="0.05" layer="39"/>
<wire x1="10.4" y1="9.15" x2="10.4" y2="-9.15" width="0.05" layer="39"/>
<wire x1="10.4" y1="-9.15" x2="-10.4" y2="-9.15" width="0.05" layer="39"/>
<wire x1="-10.4" y1="-9.15" x2="-10.4" y2="9.15" width="0.05" layer="39"/>
<text x="-10.16" y="10.16" size="1.27" layer="25">&gt;NAME</text>
<text x="-10.16" y="-11.43" size="1.27" layer="27">&gt;VALUE</text>
<pad name="OUT" x="-8.88" y="-6.99" drill="1.02"/>
<pad name="P1" x="-8.05" y="6.7" drill="2.38"/>
<pad name="GND2" x="-8.88" y="-4.45" drill="1.02"/>
<pad name="GND1" x="-8.88" y="-1.91" drill="1.02"/>
<pad name="VIN" x="-8.88" y="0.63" drill="1.02"/>
<pad name="EN" x="-8.88" y="3.17" drill="1.02"/>
<pad name="P2" x="7.95" y="-6.8" drill="2.38"/>
</package>
</packages>
<symbols>
<symbol name="2851" library_version="1">
<wire x1="-10.16" y1="5.08" x2="10.16" y2="5.08" width="0.254" layer="94"/>
<wire x1="10.16" y1="5.08" x2="10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="-7.62" x2="-10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-7.62" x2="-10.16" y2="5.08" width="0.254" layer="94"/>
<text x="-10.16" y="5.842" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<pin name="!EN" x="-15.24" y="-2.54" length="middle" direction="in"/>
<pin name="VIN" x="-15.24" y="2.54" length="middle" direction="in"/>
<pin name="VOUT" x="15.24" y="2.54" length="middle" direction="out" rot="R180"/>
<pin name="GND" x="15.24" y="-5.08" length="middle" direction="pwr" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="2851" prefix="VR" library_version="1">
<description>Description: Pololu 5V, 5A Step-Down Voltage Regulator D24V50F5  &lt;a href="https://pricing.snapeda.com/parts/2851/Pololu/view-part?ref=eda"&gt;Check prices&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="2851" x="0" y="0"/>
</gates>
<devices>
<device name="" package="VREG_2851">
<connects>
<connect gate="G$1" pin="!EN" pad="EN"/>
<connect gate="G$1" pin="GND" pad="GND1 GND2"/>
<connect gate="G$1" pin="VIN" pad="VIN"/>
<connect gate="G$1" pin="VOUT" pad="OUT"/>
</connects>
<technologies>
<technology name="">
<attribute name="AVAILABILITY" value="Bad"/>
<attribute name="DESCRIPTION" value=" Description: Pololu 5V, 5A Step-Down Voltage Regulator D24V50F5 "/>
<attribute name="MF" value="Pololu"/>
<attribute name="MP" value="2851"/>
<attribute name="PACKAGE" value="Package "/>
<attribute name="PRICE" value="None"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/2851/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0.2032" drill="0">
</class>
<class number="1" name="power" width="0.508" drill="0">
</class>
</classes>
<parts>
<part name="LIFTER" library="Connector" deviceset="PINHD-1X6" device="/90" package3d_urn="urn:adsk.eagle:package:22475/2"/>
<part name="LIMIT" library="Connector" deviceset="PINHD-2X2" device="" package3d_urn="urn:adsk.eagle:package:22455/2"/>
<part name="SUPPLY9" library="Power_Symbols" deviceset="GND" device="" value="GND"/>
<part name="SUPPLY1" library="Power_Symbols" deviceset="+5V" device="" value="+5V"/>
<part name="SUPPLY10" library="Power_Symbols" deviceset="GND" device="" value="GND"/>
<part name="SUPPLY11" library="Power_Symbols" deviceset="+12V" device="" value="+12V"/>
<part name="SUPPLY12" library="Power_Symbols" deviceset="GND" device="" value="GND"/>
<part name="SUPPLY13" library="Power_Symbols" deviceset="+5V" device="" value="+5V"/>
<part name="SUPPLY14" library="Power_Symbols" deviceset="GND" device="" value="GND"/>
<part name="SUPPLY15" library="Power_Symbols" deviceset="+5V" device="" value="+5V"/>
<part name="U$1" library="Pololu" library_urn="urn:adsk.wipprod:fs.file:vf.Ql7qiByFRWGqrDqtTfiOKQ" deviceset="POLOLU3161" device=""/>
<part name="SUPPLY3" library="Power_Symbols" deviceset="GND" device="" value="GND"/>
<part name="U$2" library="Pololu" library_urn="urn:adsk.wipprod:fs.file:vf.Ql7qiByFRWGqrDqtTfiOKQ" deviceset="1213" device=""/>
<part name="SUPPLY2" library="Power_Symbols" deviceset="+5V" device="" value="+5V"/>
<part name="SUPPLY7" library="Power_Symbols" deviceset="GND" device="" value="GND"/>
<part name="SUPPLY16" library="Power_Symbols" deviceset="GND" device="" value="GND"/>
<part name="SUPPLY17" library="Power_Symbols" deviceset="GND" device="" value="GND"/>
<part name="SUPPLY18" library="Power_Symbols" deviceset="+12V" device="" value="+12V"/>
<part name="OUTPUT" library="Connector" deviceset="PINHD-2X5" device="/90" package3d_urn="urn:adsk.eagle:package:22471/2"/>
<part name="FRAME1" library="frames" library_urn="urn:adsk.eagle:library:229" deviceset="FRAME_A_L" device=""/>
<part name="VR1" library="2851" library_urn="urn:adsk.wipprod:fs.file:vf.wwBf7lndQe-DmSn-aNIcHw" deviceset="2851" device=""/>
<part name="SUPPLY6" library="Power_Symbols" deviceset="GND" device="" value="GND"/>
<part name="PWR" library="Connector" deviceset="PINHD-2X3" device="" package3d_urn="urn:adsk.eagle:package:22462/2"/>
<part name="I2C" library="Connector" deviceset="PINHD-2X3" device="" package3d_urn="urn:adsk.eagle:package:22462/2"/>
<part name="SUPPLY19" library="Power_Symbols" deviceset="GND" device="" value="GND"/>
<part name="SUPPLY20" library="Power_Symbols" deviceset="+5V" device="" value="+5V"/>
<part name="SUPPLY4" library="Power_Symbols" deviceset="+12V" device="" value="+12V"/>
</parts>
<sheets>
<sheet>
<plain>
<text x="81.28" y="-38.1" size="6.4516" layer="91">R2 UPPITY LIFTER</text>
</plain>
<instances>
<instance part="LIFTER" gate="A" x="20.32" y="93.98" smashed="yes">
<attribute name="NAME" x="13.97" y="104.775" size="1.778" layer="95"/>
<attribute name="VALUE" x="13.97" y="83.82" size="1.778" layer="96"/>
</instance>
<instance part="LIMIT" gate="A" x="129.54" y="17.78" smashed="yes">
<attribute name="NAME" x="120.65" y="23.495" size="1.778" layer="95"/>
<attribute name="VALUE" x="120.65" y="12.7" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY9" gate="G$1" x="-2.54" y="96.52" smashed="yes">
<attribute name="VALUE" x="-2.54" y="93.98" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY1" gate="G$1" x="5.08" y="96.52" smashed="yes">
<attribute name="VALUE" x="4.953" y="99.568" size="1.778" layer="96" align="bottom-center"/>
</instance>
<instance part="SUPPLY10" gate="G$1" x="149.86" y="20.32" smashed="yes">
<attribute name="VALUE" x="149.86" y="17.78" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY11" gate="G$1" x="35.56" y="2.54" smashed="yes">
<attribute name="VALUE" x="35.433" y="5.588" size="1.778" layer="96" align="bottom-center"/>
</instance>
<instance part="SUPPLY12" gate="G$1" x="111.76" y="-7.62" smashed="yes">
<attribute name="VALUE" x="111.76" y="-10.16" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY13" gate="G$1" x="111.76" y="2.54" smashed="yes">
<attribute name="VALUE" x="111.633" y="5.588" size="1.778" layer="96" align="bottom-center"/>
</instance>
<instance part="SUPPLY14" gate="G$1" x="83.82" y="101.6" smashed="yes">
<attribute name="VALUE" x="83.82" y="99.06" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY15" gate="G$1" x="160.02" y="99.06" smashed="yes">
<attribute name="VALUE" x="159.893" y="102.108" size="1.778" layer="96" align="bottom-center"/>
</instance>
<instance part="U$1" gate="G$1" x="45.72" y="30.48" smashed="yes"/>
<instance part="SUPPLY3" gate="G$1" x="91.44" y="73.66" smashed="yes">
<attribute name="VALUE" x="91.44" y="71.12" size="1.778" layer="96" align="center"/>
</instance>
<instance part="U$2" gate="G$1" x="-38.1" y="50.8" smashed="yes">
<attribute name="NAME" x="-55.88" y="77.089" size="1.778" layer="95"/>
<attribute name="VALUE" x="-55.88" y="17.78" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY2" gate="G$1" x="-2.54" y="73.66" smashed="yes">
<attribute name="VALUE" x="-2.667" y="76.708" size="1.778" layer="96" align="bottom-center"/>
</instance>
<instance part="SUPPLY7" gate="G$1" x="-2.54" y="20.32" smashed="yes">
<attribute name="VALUE" x="-2.54" y="17.78" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY16" gate="G$1" x="-88.9" y="35.56" smashed="yes">
<attribute name="VALUE" x="-88.9" y="33.02" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY17" gate="G$1" x="-88.9" y="43.18" smashed="yes">
<attribute name="VALUE" x="-88.9" y="40.64" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY18" gate="G$1" x="-88.9" y="66.04" smashed="yes">
<attribute name="VALUE" x="-89.027" y="69.088" size="1.778" layer="96" align="bottom-center"/>
</instance>
<instance part="OUTPUT" gate="A" x="121.92" y="96.52" smashed="yes">
<attribute name="NAME" x="115.57" y="104.775" size="1.778" layer="95"/>
<attribute name="VALUE" x="115.57" y="86.36" size="1.778" layer="96"/>
</instance>
<instance part="FRAME1" gate="G$1" x="-104.14" y="-63.5" smashed="yes"/>
<instance part="FRAME1" gate="G$2" x="68.58" y="-63.5" smashed="yes">
<attribute name="LAST_DATE_TIME" x="81.28" y="-62.23" size="2.54" layer="94"/>
<attribute name="SHEET" x="154.94" y="-62.23" size="2.54" layer="94"/>
<attribute name="DRAWING_NAME" x="86.36" y="-44.45" size="2.54" layer="94"/>
</instance>
<instance part="VR1" gate="G$1" x="76.2" y="-2.54" smashed="yes">
<attribute name="NAME" x="66.04" y="3.302" size="1.778" layer="95"/>
<attribute name="VALUE" x="66.04" y="-12.7" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY6" gate="G$1" x="15.24" y="73.66" smashed="yes">
<attribute name="VALUE" x="15.24" y="71.12" size="1.778" layer="96" align="center"/>
</instance>
<instance part="PWR" gate="A" x="134.62" y="68.58" smashed="yes">
<attribute name="NAME" x="128.27" y="74.295" size="1.778" layer="95"/>
<attribute name="VALUE" x="128.27" y="60.96" size="1.778" layer="96"/>
</instance>
<instance part="I2C" gate="A" x="134.62" y="45.72" smashed="yes">
<attribute name="NAME" x="128.27" y="51.435" size="1.778" layer="95"/>
<attribute name="VALUE" x="128.27" y="38.1" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY19" gate="G$1" x="116.84" y="76.2" smashed="yes">
<attribute name="VALUE" x="116.84" y="73.66" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY20" gate="G$1" x="149.86" y="73.66" smashed="yes">
<attribute name="VALUE" x="149.733" y="76.708" size="1.778" layer="96" align="bottom-center"/>
</instance>
<instance part="SUPPLY4" gate="G$1" x="83.82" y="71.12" smashed="yes">
<attribute name="VALUE" x="83.693" y="74.168" size="1.778" layer="96" align="bottom-center"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="SUPPLY12" gate="G$1" pin="GND"/>
<wire x1="91.44" y1="-7.62" x2="111.76" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="111.76" y1="-7.62" x2="111.76" y2="-5.08" width="0.1524" layer="91"/>
<pinref part="VR1" gate="G$1" pin="GND"/>
</segment>
<segment>
<wire x1="119.38" y1="99.06" x2="83.82" y2="99.06" width="0.1524" layer="91"/>
<pinref part="SUPPLY14" gate="G$1" pin="GND"/>
<wire x1="83.82" y1="99.06" x2="83.82" y2="104.14" width="0.1524" layer="91"/>
<pinref part="OUTPUT" gate="A" pin="3"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="GND"/>
<pinref part="SUPPLY7" gate="G$1" pin="GND"/>
<wire x1="-15.24" y1="22.86" x2="-2.54" y2="22.86" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="M1_!PWM!/D1"/>
<wire x1="-60.96" y1="45.72" x2="-88.9" y2="45.72" width="0.1524" layer="91"/>
<pinref part="SUPPLY17" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="M2_!PWM!/D1"/>
<wire x1="-60.96" y1="38.1" x2="-88.9" y2="38.1" width="0.1524" layer="91"/>
<pinref part="SUPPLY16" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="LIMIT" gate="A" pin="2"/>
<pinref part="SUPPLY10" gate="G$1" pin="GND"/>
<wire x1="132.08" y1="20.32" x2="149.86" y2="20.32" width="0.1524" layer="91"/>
<wire x1="149.86" y1="20.32" x2="149.86" y2="22.86" width="0.1524" layer="91"/>
<pinref part="LIMIT" gate="A" pin="4"/>
<wire x1="132.08" y1="17.78" x2="149.86" y2="17.78" width="0.1524" layer="91"/>
<wire x1="149.86" y1="17.78" x2="149.86" y2="22.86" width="0.1524" layer="91"/>
<junction x="149.86" y="22.86"/>
</segment>
<segment>
<pinref part="LIFTER" gate="A" pin="4"/>
<wire x1="17.78" y1="93.98" x2="-2.54" y2="93.98" width="0.1524" layer="91"/>
<pinref part="SUPPLY9" gate="G$1" pin="GND"/>
<wire x1="-2.54" y1="99.06" x2="-2.54" y2="93.98" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="GND"/>
<wire x1="35.56" y1="63.5" x2="15.24" y2="63.5" width="0.1524" layer="91"/>
<pinref part="SUPPLY6" gate="G$1" pin="GND"/>
<wire x1="15.24" y1="63.5" x2="15.24" y2="76.2" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="GND2"/>
<wire x1="50.8" y1="83.82" x2="38.1" y2="83.82" width="0.1524" layer="91"/>
<wire x1="38.1" y1="83.82" x2="38.1" y2="76.2" width="0.1524" layer="91"/>
<junction x="15.24" y="76.2"/>
<pinref part="U$1" gate="G$1" pin="GND1"/>
<wire x1="53.34" y1="83.82" x2="50.8" y2="83.82" width="0.1524" layer="91"/>
<wire x1="38.1" y1="76.2" x2="15.24" y2="76.2" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="GND4"/>
<wire x1="78.74" y1="60.96" x2="91.44" y2="60.96" width="0.1524" layer="91"/>
<pinref part="SUPPLY3" gate="G$1" pin="GND"/>
<wire x1="91.44" y1="60.96" x2="91.44" y2="76.2" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="PWR" gate="A" pin="1"/>
<wire x1="132.08" y1="71.12" x2="116.84" y2="71.12" width="0.1524" layer="91"/>
<pinref part="SUPPLY19" gate="G$1" pin="GND"/>
<wire x1="116.84" y1="71.12" x2="116.84" y2="78.74" width="0.1524" layer="91"/>
<pinref part="PWR" gate="A" pin="3"/>
<wire x1="132.08" y1="68.58" x2="116.84" y2="68.58" width="0.1524" layer="91"/>
<wire x1="116.84" y1="68.58" x2="116.84" y2="78.74" width="0.1524" layer="91"/>
<junction x="116.84" y="78.74"/>
<pinref part="PWR" gate="A" pin="5"/>
<wire x1="132.08" y1="66.04" x2="116.84" y2="66.04" width="0.1524" layer="91"/>
<wire x1="116.84" y1="66.04" x2="116.84" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="+5V" class="1">
<segment>
<pinref part="LIFTER" gate="A" pin="3"/>
<pinref part="SUPPLY1" gate="G$1" pin="+5V"/>
<wire x1="17.78" y1="96.52" x2="5.08" y2="96.52" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="91.44" y1="0" x2="111.76" y2="0" width="0.1524" layer="91"/>
<pinref part="SUPPLY13" gate="G$1" pin="+5V"/>
<wire x1="111.76" y1="0" x2="111.76" y2="2.54" width="0.1524" layer="91"/>
<pinref part="VR1" gate="G$1" pin="VOUT"/>
</segment>
<segment>
<pinref part="SUPPLY15" gate="G$1" pin="+5V"/>
<wire x1="127" y1="99.06" x2="160.02" y2="99.06" width="0.1524" layer="91"/>
<pinref part="OUTPUT" gate="A" pin="4"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="VDD"/>
<pinref part="SUPPLY2" gate="G$1" pin="+5V"/>
<wire x1="-15.24" y1="73.66" x2="-2.54" y2="73.66" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="PWR" gate="A" pin="2"/>
<wire x1="139.7" y1="71.12" x2="149.86" y2="71.12" width="0.1524" layer="91"/>
<pinref part="SUPPLY20" gate="G$1" pin="+5V"/>
<wire x1="149.86" y1="71.12" x2="149.86" y2="73.66" width="0.1524" layer="91"/>
<pinref part="PWR" gate="A" pin="4"/>
<wire x1="139.7" y1="68.58" x2="149.86" y2="68.58" width="0.1524" layer="91"/>
<wire x1="149.86" y1="68.58" x2="149.86" y2="73.66" width="0.1524" layer="91"/>
<junction x="149.86" y="73.66"/>
<pinref part="PWR" gate="A" pin="6"/>
<wire x1="139.7" y1="66.04" x2="149.86" y2="66.04" width="0.1524" layer="91"/>
<wire x1="149.86" y1="66.04" x2="149.86" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SDA" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="18"/>
<wire x1="78.74" y1="48.26" x2="93.98" y2="48.26" width="0.1524" layer="91"/>
<label x="88.9" y="48.26" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="I2C" gate="A" pin="2"/>
<wire x1="139.7" y1="48.26" x2="154.94" y2="48.26" width="0.1524" layer="91"/>
<label x="149.86" y="48.26" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="I2C" gate="A" pin="4"/>
<wire x1="139.7" y1="45.72" x2="154.94" y2="45.72" width="0.1524" layer="91"/>
<label x="149.86" y="45.72" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="I2C" gate="A" pin="6"/>
<wire x1="139.7" y1="43.18" x2="154.94" y2="43.18" width="0.1524" layer="91"/>
<label x="149.86" y="43.18" size="1.778" layer="95"/>
</segment>
</net>
<net name="SCL" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="19"/>
<wire x1="78.74" y1="50.8" x2="93.98" y2="50.8" width="0.1524" layer="91"/>
<label x="88.9" y="50.8" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="I2C" gate="A" pin="5"/>
<wire x1="132.08" y1="43.18" x2="116.84" y2="43.18" width="0.1524" layer="91"/>
<label x="116.84" y="43.18" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="I2C" gate="A" pin="3"/>
<wire x1="132.08" y1="45.72" x2="116.84" y2="45.72" width="0.1524" layer="91"/>
<label x="116.84" y="45.72" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="I2C" gate="A" pin="1"/>
<wire x1="132.08" y1="48.26" x2="116.84" y2="48.26" width="0.1524" layer="91"/>
<label x="116.84" y="48.26" size="1.778" layer="95"/>
</segment>
</net>
<net name="LFT_ENB" class="0">
<segment>
<pinref part="LIFTER" gate="A" pin="1"/>
<wire x1="17.78" y1="101.6" x2="30.48" y2="101.6" width="0.1524" layer="91"/>
<label x="25.4" y="101.6" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="35.56" y1="48.26" x2="15.24" y2="48.26" width="0.1524" layer="91"/>
<label x="15.24" y="48.26" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="4"/>
</segment>
</net>
<net name="LFT_ENA" class="0">
<segment>
<pinref part="LIFTER" gate="A" pin="2"/>
<wire x1="17.78" y1="99.06" x2="30.48" y2="99.06" width="0.1524" layer="91"/>
<label x="25.4" y="99.06" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="35.56" y1="53.34" x2="15.24" y2="53.34" width="0.1524" layer="91"/>
<label x="15.24" y="53.34" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="2"/>
</segment>
</net>
<net name="RTR_ENA" class="0">
<segment>
<wire x1="35.56" y1="50.8" x2="15.24" y2="50.8" width="0.1524" layer="91"/>
<label x="15.24" y="50.8" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="3"/>
</segment>
<segment>
<wire x1="127" y1="93.98" x2="149.86" y2="93.98" width="0.1524" layer="91"/>
<label x="142.24" y="93.98" size="1.778" layer="95"/>
<pinref part="OUTPUT" gate="A" pin="8"/>
</segment>
</net>
<net name="RTR_ENB" class="0">
<segment>
<wire x1="35.56" y1="45.72" x2="15.24" y2="45.72" width="0.1524" layer="91"/>
<label x="15.24" y="45.72" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="5"/>
</segment>
<segment>
<wire x1="127" y1="91.44" x2="149.86" y2="91.44" width="0.1524" layer="91"/>
<label x="142.24" y="91.44" size="1.778" layer="95"/>
<pinref part="OUTPUT" gate="A" pin="10"/>
</segment>
</net>
<net name="RTR_LIMIT" class="0">
<segment>
<wire x1="35.56" y1="43.18" x2="15.24" y2="43.18" width="0.1524" layer="91"/>
<label x="15.24" y="43.18" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="6"/>
</segment>
<segment>
<wire x1="127" y1="96.52" x2="149.86" y2="96.52" width="0.1524" layer="91"/>
<label x="142.24" y="96.52" size="1.778" layer="95"/>
<pinref part="OUTPUT" gate="A" pin="6"/>
</segment>
</net>
<net name="LKIT_C" class="0">
<segment>
<wire x1="119.38" y1="91.44" x2="93.98" y2="91.44" width="0.1524" layer="91"/>
<label x="93.98" y="91.44" size="1.778" layer="95"/>
<pinref part="OUTPUT" gate="A" pin="9"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="17"/>
<wire x1="78.74" y1="45.72" x2="93.98" y2="45.72" width="0.1524" layer="91"/>
<label x="88.9" y="45.72" size="1.778" layer="95"/>
</segment>
</net>
<net name="LKIT_B" class="0">
<segment>
<wire x1="119.38" y1="93.98" x2="93.98" y2="93.98" width="0.1524" layer="91"/>
<label x="93.98" y="93.98" size="1.778" layer="95"/>
<pinref part="OUTPUT" gate="A" pin="7"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="16"/>
<wire x1="78.74" y1="43.18" x2="93.98" y2="43.18" width="0.1524" layer="91"/>
<label x="88.9" y="43.18" size="1.778" layer="95"/>
</segment>
</net>
<net name="LKIT_A" class="0">
<segment>
<wire x1="119.38" y1="96.52" x2="93.98" y2="96.52" width="0.1524" layer="91"/>
<label x="93.98" y="96.52" size="1.778" layer="95"/>
<pinref part="OUTPUT" gate="A" pin="5"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="15"/>
<wire x1="78.74" y1="40.64" x2="93.98" y2="40.64" width="0.1524" layer="91"/>
<label x="88.9" y="40.64" size="1.778" layer="95"/>
</segment>
</net>
<net name="LFT_TOP" class="0">
<segment>
<pinref part="LIMIT" gate="A" pin="1"/>
<wire x1="124.46" y1="20.32" x2="104.14" y2="20.32" width="0.1524" layer="91"/>
<label x="104.14" y="20.32" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="22"/>
<wire x1="60.96" y1="20.32" x2="60.96" y2="7.62" width="0.1524" layer="91"/>
<label x="60.96" y="7.62" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="LFT_BOT" class="0">
<segment>
<pinref part="LIMIT" gate="A" pin="3"/>
<wire x1="124.46" y1="17.78" x2="104.14" y2="17.78" width="0.1524" layer="91"/>
<label x="104.14" y="17.78" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="23"/>
<wire x1="63.5" y1="20.32" x2="63.5" y2="7.62" width="0.1524" layer="91"/>
<label x="63.5" y="7.62" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="+12V" class="1">
<segment>
<wire x1="60.96" y1="0" x2="35.56" y2="0" width="0.1524" layer="91"/>
<pinref part="SUPPLY11" gate="G$1" pin="+12V"/>
<wire x1="35.56" y1="0" x2="35.56" y2="2.54" width="0.1524" layer="91"/>
<pinref part="VR1" gate="G$1" pin="VIN"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="VIN(5-28V)"/>
<wire x1="-60.96" y1="66.04" x2="-88.9" y2="66.04" width="0.1524" layer="91"/>
<pinref part="SUPPLY18" gate="G$1" pin="+12V"/>
<pinref part="U$2" gate="G$1" pin="VIN"/>
<wire x1="-60.96" y1="68.58" x2="-88.9" y2="68.58" width="0.1524" layer="91"/>
<wire x1="-88.9" y1="68.58" x2="-88.9" y2="66.04" width="0.1524" layer="91"/>
<junction x="-88.9" y="66.04"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="BAT+"/>
<wire x1="78.74" y1="63.5" x2="83.82" y2="63.5" width="0.1524" layer="91"/>
<wire x1="83.82" y1="63.5" x2="83.82" y2="71.12" width="0.1524" layer="91"/>
<pinref part="SUPPLY4" gate="G$1" pin="+12V"/>
</segment>
</net>
<net name="M1PWM2" class="0">
<segment>
<wire x1="35.56" y1="40.64" x2="15.24" y2="40.64" width="0.1524" layer="91"/>
<label x="15.24" y="40.64" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="7"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="M1_PWM/!D2"/>
<wire x1="-60.96" y1="43.18" x2="-81.28" y2="43.18" width="0.1524" layer="91"/>
<label x="-81.28" y="43.18" size="1.778" layer="95"/>
</segment>
</net>
<net name="M1IN1" class="0">
<segment>
<wire x1="35.56" y1="38.1" x2="15.24" y2="38.1" width="0.1524" layer="91"/>
<label x="15.24" y="38.1" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="8"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="M1IN1"/>
<wire x1="-60.96" y1="60.96" x2="-81.28" y2="60.96" width="0.1524" layer="91"/>
<label x="-81.28" y="60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="M1IN2" class="0">
<segment>
<wire x1="35.56" y1="35.56" x2="15.24" y2="35.56" width="0.1524" layer="91"/>
<label x="15.24" y="35.56" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="9"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="M1IN2"/>
<wire x1="-60.96" y1="58.42" x2="-81.28" y2="58.42" width="0.1524" layer="91"/>
<label x="-81.28" y="58.42" size="1.778" layer="95"/>
</segment>
</net>
<net name="RMOT1" class="0">
<segment>
<label x="93.98" y="101.6" size="1.778" layer="95"/>
<pinref part="OUTPUT" gate="A" pin="1"/>
<wire x1="96.52" y1="101.6" x2="93.98" y2="101.6" width="0.1524" layer="91"/>
<wire x1="119.38" y1="101.6" x2="96.52" y2="101.6" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="M2OUT1"/>
<wire x1="-15.24" y1="53.34" x2="2.54" y2="53.34" width="0.1524" layer="91"/>
<label x="-5.08" y="53.34" size="1.778" layer="95"/>
</segment>
</net>
<net name="RMOT2" class="0">
<segment>
<wire x1="127" y1="101.6" x2="149.86" y2="101.6" width="0.1524" layer="91"/>
<label x="142.24" y="101.6" size="1.778" layer="95"/>
<pinref part="OUTPUT" gate="A" pin="2"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="M2OUT2"/>
<wire x1="-15.24" y1="50.8" x2="2.54" y2="50.8" width="0.1524" layer="91"/>
<label x="-5.08" y="50.8" size="1.778" layer="95"/>
</segment>
</net>
<net name="M2PWM2" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="10"/>
<wire x1="53.34" y1="20.32" x2="53.34" y2="7.62" width="0.1524" layer="91"/>
<label x="53.34" y="7.62" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="M2_PWM/!D2"/>
<wire x1="-60.96" y1="35.56" x2="-81.28" y2="35.56" width="0.1524" layer="91"/>
<label x="-81.28" y="35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="M2IN1" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="11"/>
<wire x1="55.88" y1="20.32" x2="55.88" y2="7.62" width="0.1524" layer="91"/>
<label x="55.88" y="7.62" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="M2IN1"/>
<wire x1="-60.96" y1="53.34" x2="-81.28" y2="53.34" width="0.1524" layer="91"/>
<label x="-81.28" y="53.34" size="1.778" layer="95"/>
</segment>
</net>
<net name="M2IN2" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="12"/>
<wire x1="58.42" y1="20.32" x2="58.42" y2="7.62" width="0.1524" layer="91"/>
<label x="58.42" y="7.62" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="M2IN2"/>
<wire x1="-60.96" y1="50.8" x2="-81.28" y2="50.8" width="0.1524" layer="91"/>
<label x="-81.28" y="50.8" size="1.778" layer="95"/>
</segment>
</net>
<net name="MOTOR_EN" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="13"/>
<wire x1="78.74" y1="35.56" x2="93.98" y2="35.56" width="0.1524" layer="91"/>
<label x="88.9" y="35.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="EN"/>
<wire x1="-60.96" y1="30.48" x2="-81.28" y2="30.48" width="0.1524" layer="91"/>
<label x="-81.28" y="30.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="M1FB" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="14"/>
<wire x1="78.74" y1="38.1" x2="93.98" y2="38.1" width="0.1524" layer="91"/>
<label x="88.9" y="38.1" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="M1FB"/>
<wire x1="-15.24" y1="43.18" x2="2.54" y2="43.18" width="0.1524" layer="91"/>
<label x="-5.08" y="43.18" size="1.778" layer="95"/>
</segment>
</net>
<net name="LMOT1" class="0">
<segment>
<pinref part="LIFTER" gate="A" pin="5"/>
<wire x1="17.78" y1="91.44" x2="5.08" y2="91.44" width="0.1524" layer="91"/>
<label x="5.08" y="91.44" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="M1OUT1"/>
<wire x1="-15.24" y1="60.96" x2="2.54" y2="60.96" width="0.1524" layer="91"/>
<label x="-5.08" y="60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="LMOT2" class="0">
<segment>
<pinref part="LIFTER" gate="A" pin="6"/>
<wire x1="17.78" y1="88.9" x2="5.08" y2="88.9" width="0.1524" layer="91"/>
<label x="5.08" y="88.9" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="M1OUT2"/>
<wire x1="-15.24" y1="58.42" x2="2.54" y2="58.42" width="0.1524" layer="91"/>
<label x="-5.08" y="58.42" size="1.778" layer="95"/>
</segment>
</net>
<net name="M1SF" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="M1!SF"/>
<wire x1="-15.24" y1="45.72" x2="2.54" y2="45.72" width="0.1524" layer="91"/>
<label x="-5.08" y="45.72" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="21"/>
<wire x1="78.74" y1="55.88" x2="93.98" y2="55.88" width="0.1524" layer="91"/>
<label x="88.9" y="55.88" size="1.778" layer="95"/>
</segment>
</net>
<net name="M2FB" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="M2FB"/>
<wire x1="-15.24" y1="35.56" x2="2.54" y2="35.56" width="0.1524" layer="91"/>
<label x="-5.08" y="35.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="20"/>
<wire x1="78.74" y1="53.34" x2="93.98" y2="53.34" width="0.1524" layer="91"/>
<label x="88.9" y="53.34" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
<errors>
<approved hash="202,1,60.96,-5.08,VR1,!EN,,,,"/>
<approved hash="202,1,63.5,83.82,U$1,DTR,,,,"/>
<approved hash="202,1,60.96,83.82,U$1,TXD0_1,,,,"/>
<approved hash="202,1,58.42,83.82,U$1,RXDO_1,,,,"/>
<approved hash="202,1,55.88,83.82,U$1,VCCIN,,,,"/>
<approved hash="202,1,53.34,83.82,U$1,GND1,,,,"/>
<approved hash="202,1,50.8,83.82,U$1,GND2,,,,"/>
<approved hash="202,1,35.56,63.5,U$1,GND,,,,"/>
<approved hash="202,1,35.56,58.42,U$1,RXD0,,,,"/>
<approved hash="202,1,35.56,55.88,U$1,TXD0,,,,"/>
<approved hash="202,1,78.74,58.42,U$1,VCC2,,,,"/>
<approved hash="202,1,78.74,60.96,U$1,GND4,,,,"/>
<approved hash="202,1,78.74,63.5,U$1,BAT+,,,,"/>
<approved hash="202,1,60.96,55.88,U$1,AREF,,,,"/>
<approved hash="202,1,60.96,58.42,U$1,VCC1,,,,"/>
<approved hash="202,1,60.96,60.96,U$1,GND3,,,,"/>
<approved hash="202,1,60.96,63.5,U$1,VIN,,,,"/>
<approved hash="202,1,60.96,20.32,U$1,22,,,,"/>
<approved hash="202,1,63.5,20.32,U$1,23,,,,"/>
<approved hash="202,1,50.8,43.18,U$1,MISO,,,,"/>
<approved hash="202,1,50.8,45.72,U$1,VCC3,,,,"/>
<approved hash="202,1,53.34,45.72,U$1,MOSI,,,,"/>
<approved hash="202,1,55.88,45.72,U$1,GND5,,,,"/>
<approved hash="202,1,55.88,43.18,U$1,RESET2,,,,"/>
<approved hash="202,1,53.34,43.18,U$1,SCK,,,,"/>
<approved hash="204,1,-15.24,73.66,U$2,VDD,,,,"/>
<approved hash="202,1,-60.96,27.94,U$2,SLEW,,,,"/>
<approved hash="202,1,-60.96,25.4,U$2,INV,,,,"/>
<approved hash="208,1,160.02,99.06,+5V,sup,,,,"/>
</errors>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
