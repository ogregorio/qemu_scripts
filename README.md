# QEMU Script
## A Simple SH to launch MorphOS with QEMU
Um repositório que agrupa scripts para execução de sistemas operacionais exóticos pelo QEMU

Cada pasta está dedicada a um SO com as respectivas intruções de execução, caso queira fazer um pull request do seu sistema, favor manter o padrão dos arquivos. 

## Dependencies
 - Obviously: QEMU System PPC
 - Also, quite obviously: Interpreter SH (Bash/ZSH/sh)
 - Not so obvious: MorphOS ISO, obtained directly from the [official website](https://morphos-team.net/)

## Features
- MorphOS System
- TempleOS System

## Variables
In the scripts you will find some variables, they indicate:
- QEMU_BIN => binary of QEMU to emulate the system
- SYSTEM_IMAGE => runnable system image
- TOTAL_MEMORY => Free memory for QEMU in megabytes  

* This variables are the default, but can be extended system by sytem

Now you can try the better OSs after Linux.
