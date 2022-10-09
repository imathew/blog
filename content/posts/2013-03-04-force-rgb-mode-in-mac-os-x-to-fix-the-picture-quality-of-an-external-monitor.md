---
title: "Force RGB mode in Mac OS X to fix the picture quality of an external monitor"
description: "Force RGB mode in Mac OS X to fix the picture quality of an external monitor"
date: "2013-03-04"
categories: 
  - "technology"
comments: true
image: "/img/applelogo.png"
---

I recently bought a MacBook Pro (with 'Retina' screen), but when I hooked it up to my Dell U2410 monitor via HDMI cable I was shocked by the poor picture quality. The contrast was all wrong and text was misshapen. No amount of calibration in the monitor or software would fix it.

Short answer: OS X thinks my monitor is a TV, and is using the YCbCr colour space rather than RGB. I had to override an EDID setting to force the RGB colour space, and it is now working correctly.

Long answer: I haven't owned a Mac for a while and had forgotten how difficult much of the "Apple community" can be when it comes to anything that can't be adjusted in System Preferences. Googling for problems with external monitors on MacBooks found dozens of threads on official and unofficial Apple forums, all full of people with the same problem. The most common response was to blame the monitor, despite assurances from the stricken users that the monitor worked beautifully in Linux and Windows, _even on the same machine under Boot Camp_.

"You just haven't calibrated it!", "You are just too used to Retina now!", "You just need to buy a Thunderbolt display!" Apple people also like to solve problems by throwing more money at it. (I realise that owning a Mac makes me an Apple person, too. Hypocritical self-loather?)

My lucky break was reading that the current colour space was "YCbCr" when I was browsing the monitor's settings menu. I was sure that it was using RGB when hooked up to my PC, so I started searching instead for forcing RGB mode in OS X. It didn't appear to be available out-of-the-box, but I have had some experience in overriding [EDID](//en.wikipedia.org/wiki/Extended_display_identification_data "EDID") settings for similar purposes so I searched instead for that.

I found [this thread](//embdev.net/topic/284710 "Dell U2713H on Mac: forcing RGB mode instead of YCbCr") on the EmbDev.net forums. Mr Schwarz, thanks very much. Your thread and [script](//embdev.net/topic/284710#3027030 "Forums post containing patch-edid.rb script") was incredibly helpful and informative. It was written to fix problems connecting an external monitor via DisplayPort, but it fixed my HDMI issue just the same. I've summarised the required steps below.

My last word is to wonder what Apple is playing at. It seems that this problem has been reported by a lot of people for a long time, and I expect it would require a fairly simple software update. Do they just not care about those using third-party components, or are they actively attempting to force people on to Thunderbolt displays?

## How to force RGB in Mac OS X

_These steps have been updated for Mac OS version 10.11, "El Capitan". See below for differences for previous versions of the system._

1. Download the patch-edid.rb script from the forums thread above, **or** download Andrew Daugherity's [improved patch-edid.rb script](//gist.github.com/adaugherity/7435890 "Andrew Daugherity's improved patch-edid.rb script") from his github page. Put the script in your home directory.
2. Disable "rootless" mode, you can follow these instructions: [How to modify System Integrity Protection in El Capitan](//www.macworld.com/article/2986118/security/how-to-modify-system-integrity-protection-in-el-capitan.html "How to modify System Integrity Protection in El Capitan").
3. Reboot.
4. Connect only the external monitor(s) in question, if you can (I closed my MacBook lid, for example). The script will make override files for any connected monitor.
5. Type "ruby patch-edid.rb" in Terminal.
6. A new folder will be created in your home directory. Move it into the "/System/Library/Displays/Contents/Resources/Overrides" folder. You may have to create the Resources and Overrides folders. If Finder tells you that you are overwriting an existing folder, consider backing it up first.
7. Restart your computer. The picture quality should be fixed from this point.
8. Re-enable "rootless" mode, the instructions are available on the same guide: [How to modify System Integrity Protection in El Capitan](//www.macworld.com/article/2986118/security/how-to-modify-system-integrity-protection-in-el-capitan.html "How to modify System Integrity Protection in El Capitan").
9. Reboot. Enjoy your monitor.

To undo the changes, either delete the folder you had copied to the Overrides folder (if it didn't already exist) or replace it with the folder you had backed up. You will need to re-enable rootless mode to do this.

## Earlier versions of Mac OS X

The process is a little more straightforward. There are two differences to the steps above:

1. You do not need to disable/re-enable rootless mode and perform the subsequent reboots.
2. The overrides folder location is "/System/Library/Displays/Overrides".

## Updates

I no longer own a Macbook Pro, but if you're having trouble with any of these steps, please have a look through the comments below (and note that there are multiple pages). Many questions have been answered with helpful tips from others.

**Update, 20 Nov 2016:** In the comments [Marcus has proposed a faster method](/2013/03/force-rgb-mode-in-mac-os-x-to-fix-the-picture-quality-of-an-external-monitor/#comment-15886 "Marcus' post") that doesn't require SIP to be disabled. Others have had success with it so give it a go if you're uncomfortable with disabling SIP.

**Update, 8 Feb 2016:** A [comment from nos1609](/2013/03/force-rgb-mode-in-mac-os-x-to-fix-the-picture-quality-of-an-external-monitor/#comment-15019 "Peter's post") below, warns about a bootloop that can occur when running other patches (like the pixel-clock patch) simultaneously, and how to get around it.

**Update, 23 Nov 2015:** According to Peter's [post](/2013/03/force-rgb-mode-in-mac-os-x-to-fix-the-picture-quality-of-an-external-monitor/#comment-14866 "Peter's post"), you don't need to disable SIP if you use recovery mode. If others have similar success with this method I'll update the process.

**Update, 3 Oct 2015:** I have amended this post to target El Capitan. I have taken the steps from bigmcguire's [process](/2013/03/force-rgb-mode-in-mac-os-x-to-fix-the-picture-quality-of-an-external-monitor/#comment-14684 "bigmcguire's process"), posted in the comments. Although some are still having issues, it appears to be working for people. Thanks!

**Update, 29 May 2015:** Mac OS 10.11 El Capitan does things a little differently. You must first disable the new 'rootless' mode and then use a different overrides folder: /System/Library/Displays/Contents/Resources/Overrides. Rootless can then be re-enabled if desired, as confirmed by nos1609 in the [comments below](/2013/03/force-rgb-mode-in-mac-os-x-to-fix-the-picture-quality-of-an-external-monitor/#comment-14366 "nos1609's comment"). El Capitan is still in beta, I'll update this post if the issue is still apparent afterwards.

**Update, 26 May 2014:** If you have had trouble with limited resolutions being available after the fix, check out Ibrahim's [comments here](/2013/03/force-rgb-mode-in-mac-os-x-to-fix-the-picture-quality-of-an-external-monitor/#comment-10104 "Ibrahim's comment").

**Update, 28 Nov 2013:** If the process appears to work but doesn't seem to make a difference, consider Tom's [comments below](/2013/03/force-rgb-mode-in-mac-os-x-to-fix-the-picture-quality-of-an-external-monitor/#comment-9491 "Tom's comment"). Depending on your monitor an extra tweak may be required.

**Update, 13 Nov 2013:** Andrew [comments below](/2013/03/force-rgb-mode-in-mac-os-x-to-fix-the-picture-quality-of-an-external-monitor/#comment-9463 "Andrew's comment") that he has modified the script to add some useful new features, and provides a link to his GitHub for those wishing to use it instead.

**Update, 27 Oct 2013:** If you've applied this fix before, the OS X Mavericks update will overwrite it. I've successfully re-applied the fix by following exactly the same steps, and other commenters below have done so, too.