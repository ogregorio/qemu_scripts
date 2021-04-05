# FreeDOS QEMU Script
## A Simple SH to launch FreeDOS with QEMU
A simple script to launch FreeDOS in your x86 PC with graphical acceleration.

## Dependencies
 - QEMU Virgil/qemu-system-x86/qemu-system-x86_64
 - Obviously: Interpreter SH (Bash/ZSH/sh)
 - FreeDOS ISO, obtained directly from the [official website](https://www.freedos.org/)

## Features
- Create a hard disk for FreeDOS
- Boot from CD
- Boot from HD without graphical acceleration
- Boot from HD with graphical acceleration

## Variables
In the freedos.sh script you will find some variables, they indicate:
- QEMU_x86_64_BIN => binary of QEMU to emulate 64-bit x86
- QEMU_x86_VIRGIL => binary of QEMU to emulate 64-bit x86 with Virgil Support
- SYSTEM_IMAGE => FreeDOS downloaded ISO location
- TOTAL_MEMORY => Free memory for QEMU in megabytes (I recommend 64)
- MAX_CPU => CPU limit (Only one)

Now you can try the better DOS based system in the world.
