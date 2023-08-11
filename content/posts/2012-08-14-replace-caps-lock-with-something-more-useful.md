---
title: "Replace caps lock with something more useful"
description: "Caps lock is pointless but it's in a handy position, so let's repurpose it."
date: "2012-08-14"
categories: 
  - "technology"
---

I rarely use the easy-to-reach caps lock key, but I often stretch my little finger to get to the control key. And I never use the scroll lock key. So, in a fit of ergomania I made some changes to the Windows registry.

- **scroll lock** becomes **caps lock**
- **caps lock** becomes **control**
- **control** is... still **control**

I have successfully done this in Windows XP, Vista, and 7. There are numerous key-mapping programs around that do the same thing but since this is the only change I wanted to make, it was easier just to set it and forget it.

Here's how to start using your caps lock key more often. Or less often, if you are a shouty, chain-email-forwarding great uncle.

## Control

To set caps lock to act as control, and set scroll lock to act as caps lock:

1. Create a file with a .reg extension and insert the text in the block below (ensure that it ends with a new line).
2. Double-click on the file, select 'Yes', then restart your computer.

``` reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout] "Scancode Map"=hex:00,00,00,00,00,00,00,00,03,00,00,00,1d,00,3a,00,3a,00,46,00,00,00,00,00

```

## Backspace

Alternatively to set caps lock to act as backspace while still setting scroll lock to act as caps lock:

1. Follow the same process as above, but use the following code.

``` reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout] "Scancode Map"=hex:00,00,00,00,00,00,00,00,03,00,00,00,0E,00,3a,00,3a,00,46,00,00,00,00,00

```

## Undo

To undo either of the above changes by returning your keyboard to the default mapping:

1. Follow the same process as previously, but use the following code.

``` reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout] "Scancode Map"=hex:00,00,00,00,00,00,00,00,03,00,00,00,3a,00,3a,00,46,00,46,00,00,00,00,00

```