# QEMU Script
## A repo with simplified scripts to launch exotics systems with QEMU
A repository that groups scripts to emulate exotic operating systems powered by QEMU.

Each folder is dedicated to an OS with the respective execution instructions, if you want to make a pull request from your system, please keep the pattern.

## Dependencies
 - Obviously: QEMU
 - Also, quite obviously: Interpreter SH (Bash/ZSH/sh)
 - Not so obvious: ISO, obtained directly from the official systems websites (more inside systems README)

## Features
- MorphOS System
- TempleOS System
- HaikuOS System

## Variables
In the scripts you will find some variables, they indicate:
- QEMU_BIN => binary of QEMU to emulate the system
- SYSTEM_IMAGE => runnable system image
- TOTAL_MEMORY => Free memory for QEMU in megabytes  

* This variables are the default, but can be extended system by system

Now you can try the better OSs after Linux.
