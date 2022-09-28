---
title: "VGA video with HDMI audio on the Acer Revo"
description: "How to combine VGA video with HDMI audio on the Acer Revo"
date: "2012-03-06"
categories: 
  - "technology"
code: true
---

_This information is for a specific setup of the Acer AspireRevo 3700 with XBMC, but it shows that there is no hardware limitation and may provide hints for achieving the same result with other models and configurations._

## XBMC

Since 2004 my original Xbox has served as a cheap entertainment centre. Until last week it was running [XBMC4Xbox](//www.xbmc4xbox.org/ "XBMC4Xbox"), a branch of [XBMC](//xbmc.org/ "XBMC") that has been built specifically for the console since the main project began to target newer, beefier hardware. However, the Xbox struggles with most high definition content, so to play such files I was forced to use my PS3 and the excellent [PS3 Media Server](//www.ps3mediaserver.org/ "PS3 Media Server").

As great as that software is, using the PS3 for any kind of media management after being spoiled my XBMC is a pain. I recently bit the bullet and bought a net-top computer in order to install XBMC and use it to play all of my content. I chose the [Revo 3700](//us.acer.com/ac/en/US/content/model/PT.SEM02.011 "Revo 3700") because it ticks a number of boxes - particularly its support for VGA-out. Most similar devices have dumped this feature, making them incompatible with my Sony Wega CRT.

XBMC comes in a number of flavours, but a third-party Linux distribution called [OpenELEC](//www.openelec.tv/ "OpenELEC") appealed to me because it is built from scratch specifically for XBMC. It also provides a version compiled for the ION GPU used by the Revo. This means it boots quickly, runs efficiently, and is incredibly easy to install. For most setups this would have been the end of the story, but I had a specific configuration in mind.

## Configuration

Although I require VGA for video, my Yamaha receiver takes HDMI and I was keen to take advantage of the [benefits](//www.tested.com/news/hdmi-vs-optical-vs-analog-audio-whats-the-best-connection/632/) it has over optical audio. This is where I ran into trouble - if the HDMI cable was connected the system would assume that it was being used for video, and would switch off the VGA.

OpenELEC allows the user to edit the X.Org configuration by creating an [xorg.conf](//www.x.org/releases/X11R7.6/doc/man/man5/xorg.conf.5.xhtml "xorg.conf") file in a specific config folder. I found that I could specify that the graphics device (an NVIDIA ION2) should use the CRT display, but when I did that the HDMI would be disabled entirely - the HDMI indicator on my receiver would turn off. It seems that in order to use the HDMI audio, X needs to send HDMI video, too.

What I've done is simply enable the NVIDIA feature "TwinView", and set its orientation option to "clone" mode. This means that the same video is being sent to both the VGA and HDMI outputs. I've pasted my xorg.config file below; in most setups just the Device section would suffice but I was required to flesh it out a bit more to accommodate my TV.

```
# X.Org configuration: /storage/.config/xorg.conf
 
# define the mode required by the TV
Section "Modes"
  Identifier "modes"
  Modeline   "1280x720" 74.250 1280 1330 1370 1650 720 725 730 750 +hsync +vsync
EndSection
 
# define the device and enable cloning
Section "Device"
  Identifier "device"
  Driver     "nvidia"
  Option     "TwinView" "true"
  Option     "TwinViewOrientation" "Clone"
EndSection
 
# define a monitor so that we can select the custom modes
Section "Monitor"
  Identifier "monitor"
  UseModes   "modes"
EndSection
 
# define the screen and select the mode
Section "Screen"
  Identifier "screen"
  Device     "device"
  Monitor    "monitor"
  SubSection "Display"
    Depth      24
    Modes      "1280x720"
  EndSubSection
EndSection
```

## Extras

X could not retrieve the TV's [EDID](//en.wikipedia.org/wiki/Extended_display_identification_data "EDID"), so I had to define a [modeline](//en.wikipedia.org/wiki/XFree86_Modeline "Modeline") manually. I found this by connecting my PC to the TV and using [PowerStrip](//entechtaiwan.com/util/ps.shtm "PowerStrip") to set my desired resolution and calibration. The software then provided the "Modeline" above.

Finally, in order to use the correct sound device I had to set custom values in XBMC's audio settings. These values were provided by Therio on the OpenELEC forums:

```
Audio output: HDMI Output device: custom -> plughw:1,7 Passthrough device: custom -> plughw:1,7
```

Everything is now working perfectly.