---
title: "Unbricking a Seagate Barracuda"
description: "Unbricking a Seagate Barracuda 7200.11 hard drive that is afflicted with the BSY firmware error."
date: "2009-05-13"
categories: 
  - "technology"
gallery: true
comments: true
image: "/img/removecard.jpg"
---

Recently, one of my hard disks 'disappeared' from my computer - it was not being detected in the BIOS. It turned out that this was a known issue with my drive, and one for which Seagate had released a firmware update.

Unfortunately, the update could only be applied to functioning drives. Seagate will apply the fix to bricked drives for free, but I was reluctant to send my drive to them because I didn't want to give strangers access to my personal information. I wanted to do it myself.

After a bit of a search I came across this [enormous thread](//www.msfn.org/board/index.php?showtopic=128807). The first post has changed quite a bit since I first saw it - it initially contained a lot of true and false information, and the same followed in the rest of the thread. I spent some time cross-referencing the various opinions and experiences, and finally managed to unbrick my drive.

I had intended to provide a how-to here but I have since discovered that someone has [already done it](//sites.google.com/site/seagatefix/Home). What I did was pretty much the same as the author of that guide, except that I used a USB cable instead of a serial adapter.

I found myself a Nokia data cable (DKU-5) and cut off the phone end. With the help of a multimeter I determined which wires were used for transmit, receive and ground, and connected them to some wires I cut off an internal CD-ROM cable. These wires were attached to jumper pins, which I was able to slot into the hard disk. The USB end plugged into my computer, and I was able to connect to my hard disk via [putty](//www.chiark.greenend.org.uk/~sgtatham/putty/).

Apart from that, the steps I followed are identical to the guide above. I don't recommend that people do it - if you have this problem and aren't wearing a tinfoil hat, I reckon you ought to send it back to Seagate and safely recover your data.

Here are a few photos that I took during the operation.

{{< gallery caption-position="none" >}}
  {{< gbox src="/img/removecard.jpg" title="Removing the PCB board" alt="Underside of a hard disk, showing the unscrewing of the PCB" >}}
  {{< gbox src="/img/cardoff.jpg" title="Board removed" alt="Underside of a hard disk with the PCB removed" >}}
  {{< gbox src="/img/multimeter.jpg" title="Checking which wires are which" alt="A multimeter showing continuity between connector and wire" >}}
  {{< gbox src="/img/thetools.jpg" title="The full kit" alt="Underside of a hard disk, including the tools used for the process. USB cable, screwdriver, cardboard" >}}
  {{< gbox src="/img/underdesk.jpg" title="The mess" alt="A messy computer desk with the hard disk PCB connected via USB" >}}
{{< /gallery >}}