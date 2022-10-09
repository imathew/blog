---
title: "The N40L NAS with the Icy Dock DuoSwap"
description: "The HP N40L is a handy server, with a few alterations."
date: "2013-03-19"
categories: 
  - "technology"
gallery: true
comments: true
image: "/img/Front.jpg"
---

A recent tech buy was an [HP ProLiant N40L MicroServer](//n40l.fandom.com/wiki/HP_MicroServer_N40L_Wiki "HP ProLiant N40L"), which serves as a NAS, a Sick Beard/SABnzbd+/Deluge server, and as a backup server.

I've added an [IcyDock Duo Swap](//www.icydock.com/goods.php?id=141 "IcyDock Duo Swap") to the 5.25" bay. I use its 3.5" bay for rotating HDD backups, and its 2.5" bay for the system SSD. Having the OS drive in a hotswap bay is pointless, but it kept the case neat.

There is a fifth SATA port on the motherboard, but to use a sixth drive I was required to use a SATA to eSATA cable and poke it out to the eSATA port at the back of the case. I also found the case fan a bit noisier than I liked, so I replaced it. Concerned by the possibility of buying an incompatible PWM model as warned by [this article](//silentpcreview.com/hp-proliant-microserver/ "Quiet Fan Swap For HP MicroServer"), I used a non-PWM fan and set the RPM manually.

In order to make the drives hot-swappable I was required to install a [modified bios](//homeservershow.com/blog/byob-hardware/hp-proliant-n40l-microserver-build-and-bios-modification-revisited/ "HP ProLiant N40L MicroServer Build and BIOS Modification Revisited") and alter some advanced configuration settings.

{{< gallery caption-position="none" >}}
  {{< gbox src="/img/Front-internal.jpg" title="I have covered the light (below the DuoSwap) with gaffer tape. Like tinsel, I find it distracting." alt="Front internal view of the NAS" >}}
  {{< gbox src="/img/Front-sans-HDD.jpg" title="A flap drops down after ejecting the HDD" alt="Front internal view of the NAS with the HDD removed" >}}
  {{< gbox src="/img/Top-connections.jpg" title="The DuoSwap has two SATA connectors and a single power input." alt="The top internal view of the NAS" >}}
  {{< gbox src="/img/Top-disconnections.jpg" title="The three cables when disconnected from the DuoSwap." alt="Top internal view of the DuoSwap, with disconnected cables" >}}
  {{< gbox src="/img/Top-sans-HDD.jpg" title="After ejecting the HDD the SSD can be seen." alt="Top internal view of the NAS after removing the HDD" >}}
  {{< gbox src="/img/Front.jpg" title="A HDD and a SSD in the DuoSwap." alt="The front of the NAS" >}}
  {{< gbox src="/img/Back.jpg" title="The replacement fan and eSATA cable." alt="External rear view of the NAS" >}}
  {{< gbox src="/img/eSata.jpg" title="The eSATA cable is snaked back inside the case." alt="The rear of the NAS, showing the eSATA cable" >}}
  {{< gbox src="/img/On-shelf-closeup.jpg" title="The light is glowing here because I hadn't yet covered it." alt="The NAS on a shelf" >}}
  {{< gbox src="/img/On-shelf.jpg" title="Fits in nicely next to some books and a printer." alt="The NAS on a self next to books" >}}
  {{< gbox src="/img/Inside-door.jpg" title="Apparently the inner door guard can be removed and covered with a makeshift filter of nylon stockings. I will attempt this feat." alt="The NAS door shown from the inside" >}}
{{< /gallery >}}

Ubuntu-server 12.10 is installed, along with Sick Beard, [SABnzbd+](//sabnzbd.org "SABnzbd+"), and [Deluge](//deluge-torrent.org "Deluge"). At some point it may also host an XBMC database, so to handle these services better I've upgraded the box to 8GB RAM.

Both AFP and CIFS are used to allow my MacBook and HTPC to connect to it with ease. I briefly played with NFS but couldn't get the bindings and permissions to work correctly. I like that the client machines use their own native mechanisms, anyway.

I've also made it a printer server by installing CUPS, and I made it work for iPads by installing Avahi, roughly following [this method](//confoundedtech.blogspot.com.au/2012/12/ios6-airprint-without-true-airprint.html "Ubuntu 12.04 & iOS6 AirPrint without a true AirPrint compatible device ").

I played around a bit with software RAID via [mdadm](//www.ducea.com/2009/03/08/mdadm-cheat-sheet/ "mdadm Cheat Sheet") (the advertised integrated RAID is only [FakeRAID](//help.ubuntu.com/community/FakeRaidHowto "Ubuntu FakeRaidHowto")), and it works well, but ended up just going straight with the various HDDs I had sitting around. I don't need redundancy, I just wanted backups of my documents and photos.

Local backups are made using rsync and rotating external HDDs in the DuoSwap. Automated external backups are performed using the excellent little tool [encrb](//github.com/hoxu/encrb "encrb - encrypted remote backups") to upload encrypted data to a private server.

That's about it.