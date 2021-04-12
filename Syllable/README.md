# Syllable QEMU Script
## A Simple SH to launch Syllable with QEMU
A simple script to launch Syllable in your x86 PC with graphical acceleration.

## Dependencies
 - QEMU Virgil/qemu-system-x86/qemu-system-x86_64
 - Obviously: Interpreter SH (Bash/ZSH/sh)
 - Syllable ISO, obtained directly from the [official website](https://sourceforge.net/projects/syllable/)

## Features
- Create a hard disk for Syllable
- Boot from CD
- Boot from HD without graphical acceleration
- Boot from HD with graphical acceleration

## Variables
In the haiku.sh script you will find some variables, they indicate:
- QEMU_x86_BIN => binary of QEMU to emulate 64-bit x86
- QEMU_x86_VIRGIL => binary of QEMU to emulate 64-bit x86 with Virgil Support
- SYSTEM_IMAGE => Syllable downloaded ISO location
- TOTAL_MEMORY => Free memory for QEMU in megabytes (I recommend 2048)

Now you can try this system.
