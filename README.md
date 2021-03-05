# MorphOS QEMU Script
## A Simple SH to launch MorphOS with QEMU
A simple script to launch MorphOS in your x86_64 PC.

## Dependencies
 - Obviously: QEMU
 - Also, quite obviously: Interpreter SH
 - Not so obvious: MorphOS ISO, obtained directly from the official website

## Features
- Create a hard disk for MorphOS
- Boot from CD
- Boot from HD
- Boot from HD with graphical acceleration

## Variables
In the morphos.sh script you will find some variables, they indicate:
- QEMU_PPC_BIN => binary of QEMU to emulate 32-bit Power PC location
- MORPHOS_IMAGE => MorphOS downloaded ISO location
- TOTAL_MEMORY => Free memory for QEMU in megabytes  (I recommend 2048)

Now you can try the better OS after linux.
