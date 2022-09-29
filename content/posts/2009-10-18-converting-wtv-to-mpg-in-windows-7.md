---
title: "Converting .wtv to .mpg in Windows 7"
description: "Batch conversion of WTV files to MPEG2 for better performance on the PlayStation 3."
date: "2009-10-18"
lastmod: "2014-02-25"
categories: 
  - "technology"
code: true
comments: true
---

**Update 2014-02-25:** _As Marc has said in a [comment below](/2009/10/converting-wtv-to-mpg-in-windows-7/comment-page-1#comment-9455 "Marc's comment"), ffmpeg now supports wtv files natively, so the dvr-ms step is unnecessary. I no longer use this process at all so I haven't updated it, but will leave it here for posterity._

I use a PlayStation 3 to watch TV programmes recorded in Windows 7.  The media sharing functionality in 7 is much better than in Vista, and it's quite simple to share the Recorded TV folder and watch .wtv files on the PS3. However, I prefer to convert the .wtv files to .mpg, and use the excellent [PS3 Media Centre](//ps3mediaserver.org/) to serve them. In my experience, .wtv files on the PS3 are:

- Slow: I find that fast-forwarding or using the "scene search" functionality lags much more than when watching .mpg files.
- Not pretty: To my eye, .wtv files are blockier (on the PS3) than the .mpgs I create.
- Bigger: 3.5 hours of HD Sunday Night Football creates a .wtv file of around 20GB. After converting to .mpg the file is about 18GB. This is trivial with the cost of storage at the moment, but it's interesting nonetheless.

The WTV format is relatively new, having replaced the DVR-MS format that Windows used previously. Windows 7 provides the functionality to convert .wtv files "back" to .dvr-ms files, and to do so is as easy as right-clicking the source file and selecting "Convert to dvr-ms Format". This is crucial functionality since, while WTV is completely new, DVR-MS is based on the well-known ASF format. This makes it easy to retrieve the core MPEG2 data.

To produce a .mpg file from a .dvr-ms file, we can use [ffmpeg](//ffmpeg.arrozcru.org/builds/) from the command line:

```
ffmpeg.exe -y -i "showname.dvr-ms" -vcodec copy -acodec copy -f dvd "showname.mpg"
```

Here are the options explained (taken from ffmpeg's documentation):

``` text
-y              overwrite output files
-i filename     input file name
-vcodec codec   force video codec ('copy' to copy stream)
-acodec codec   force audio codec ('copy' to copy stream)
-f fmt          force format
```

Essentially I'm telling ffmpeg to copy the audio and video streams just as they are, and to put them into DVD format (MPEG2). It doesn't perform any re-encoding, so it quickly produces a nice .mpg file that plays natively and perfectly on my PS3.

I quickly tired of having to complete a two-step process  to watch a TV show, and I wrote a batch script to do the lot at once. For each .wtv file in my Recorded TV folder, it will:

- Create a temporary .dvr-ms file from the .wtv file (using the core WTVConverter program provided by Windows 7)
- Create a .mpg file from the .dvr-ms file (using ffmpeg)
- Delete the .dvr-ms file
- Move the .mpg file to a different directory

To use this script just paste it into a .bat file and change the paths accordingly. You shouldn't need to change the value of wtvconv.

```
@echo off
 
set recordedtv="D:\Recorded TV\"
set destfolder="D:\taped\"
set ffmpeg="C:\programs\ffmpeg\ffmpeg.exe"
set wtvconv="C:\Windows\ehome\WTVConverter.exe"
 
for %%f in (%recordedtv%*.wtv) do (
  %wtvconv% "%%f" "%%f.dvr-ms"
  %ffmpeg% -y -i "%%f.dvr-ms" -vcodec copy -acodec copy -f dvd "%%f.mpg"
  del "%%f.dvr-ms"
  move "%%f.mpg" %destfolder%
)
```

I have thought about having it delete the .wtv files, too, but I prefer to check that the conversion has worked before deleting them manually. On rare occasions the process has failed with no explanation, but simply running it again has done the trick.

A couple of caveats, now. I have found that recent versions of ffmpeg sometimes fail during conversion with "_error, non-monotone timestamps._" I found a solution from [another blogger](//multidisciplinary.wordpress.com/2008/12/19/convert-dvr-ms-to-mpg-using-ffmpeg/), who suggested downloading an older version from [here](//babgvant.com/files/folders/misc/entry4997.aspx). I don't know why or how, but this works for me.

Secondly - and seemingly only when converting high-def video - ffmpeg sometimes complains, "_packet too large, ignoring buffer limits to mux it_", yet still appears to do the job correctly. I assume that this has something to do with the default buffer size used in DVD creation, but I haven't found a way to fix it. It doesn't seem to cause any problems, but for completeness' sake I'd like the solution. Please let me know if you can help!

Finally, I anticipate the question, "why don't you just use a program that records directly to .mpg?" Well, I have. I've used [GB-PVR](//www.gbpvr.com/), for example, and combined it with a variety of multiplexers. To my eyes the quality has never matched the output produced by Windows Media Centre. This has more to do with the multiplexers than the application, of course, but I also prefer using Media Centre to browse and schedule recordings. This is the best solution I've found to suit my preferences (so far).