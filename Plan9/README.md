# Plan9 QEMU Script
## A Simple SH to launch Plan9 with QEMU
A simple script to launch Plan9 in your x86 PC with graphical acceleration.

## Dependencies
 - QEMU Virgil/qemu-system-x86/qemu-system-x86_64
 - Obviously: Interpreter SH (Bash/ZSH/sh)
 - Plan9 ISO, obtained directly from the [official website](https://9p.io/plan9/)

## Features
- Create a hard disk for Plan9
- Boot from CD
- Boot from HD without graphical acceleration
- Boot from HD with graphical acceleration

## Variables
In the haiku.sh script you will find some variables, they indicate:
- QEMU_x86_BIN => binary of QEMU to emulate 64-bit x86
- QEMU_x86_VIRGIL => binary of QEMU to emulate 64-bit x86 with Virgil Support
- SYSTEM_IMAGE => Plan9 downloaded ISO location
- TOTAL_MEMORY => Free memory for QEMU in megabytes (I recommend 64)

Now you can try the better system in the world.
