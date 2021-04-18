# Icaros QEMU Script
## A Simple SH to launch Icaros with QEMU
A simple script to launch Icaros in your x86_64 PC.

## Dependencies
 - QEMU Virgil
 - Obviously: Interpreter SH (Bash/ZSH/sh)
 - Icaros ISO, obtained directly from the [official website](http://live.icarosdesktop.org/)

## Features
- Create a hard disk for Icaros
- Boot from CD
- Boot from HD with graphical acceleration

## Variables
In the Icaros.sh script you will find some variables, they indicate:

- QEMU_x86_BIN => binary of QEMU to emulate 64-bit x86
- QEMU_x86_VIRGIL => binary of QEMU to emulate 64-bit x86 with Virgil
- ICAROS_IMAGE => Icaros downloaded ISO location
- TOTAL_MEMORY => Free memory for QEMU in megabytes (I recommend 2048)

Now you can try the best AROS system in the world.