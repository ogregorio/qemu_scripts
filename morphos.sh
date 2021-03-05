#!/bin/sh

QEMU_PPC_BIN="/usr/bin/qemu-system-ppc"
MORPHOS_IMAGE="morphos-3.15.iso"
TOTAL_MEMORY="2048"

#
# Created by Arthur Gregório | Chimps and Chips2021 | MIT Licensed
#

#Function to boot from MorphOS ISO
BootCD() {
echo "Booting from CD..."
$QEMU_PPC_BIN -bios openbios-qemu.elf -L pc-bios -M mac99,via=pmu -m $TOTAL_MEMORY -device sm501 -boot d -prom-env 'boot-device=cd:,\mac_ppc32\boot.img' -cdrom $MORPHOS_IMAGE -hda Morphos-3.11.raw -vga none -serial stdio -net none -netdev user,id=network01 -device sungem,netdev=network01
}

#Function to boot from virtual Hard Disk
BootHD() {
echo "Booting from HD..."
$QEMU_PPC_BIN -bios openbios-qemu.elf -L pc-bios -M mac99,via=pmu -m $TOTAL_MEMORY -device sm501 -boot c -prom-env 'boot-device=hd:,boot.img' -hda Morphos-3.11.raw -vga none -serial stdio -net none -netdev user,id=network01 -device sungem,netdev=network01
}

#Function to boot from virtual Hard Disk with GPU acceleration
BootHDGPU() {
echo "Booting from HD with graphic acceleration..."
$QEMU_PPC_BIN -bios openbios-qemu.elf -L pc-bios -M mac99,via=pmu -m $TOTAL_MEMORY -device sm501 -boot c -prom-env 'boot-device=hd:,boot.img' -hda Morphos-3.11.raw -vga std -display sdl,gl=on -serial stdio -net none -netdev user,id=network01 -device sungem,netdev=network01
}

#Function to create a RAW virtual Hard Disk
CreateRAW() {
echo "Creating a MorphOS disk..."
qemu-img create -f raw Morphos-3.11.raw $1 && echo 'Created with success!'
}

#Help function
Help() {
echo "--create-raw 10G	to create a virtual Hard Disk with 10 Gigabytes."
echo "--boot-cd		to boot from ISO and start install."
echo "--boot-hd		to boot from virtual Hard Disk after install."
echo "--boot-hd-gpu		to boot from virtual Hard Disk after install with GPU acceleration."
echo "--help			show help."
}

case $1 in
"--create-raw") CreateRAW $2 ;;
"--boot-cd") BootCD ;;
"--boot-hd") BootHD ;;
"--boot-hd-gpu") BootHDGPU ;;
"--help") Help;;
esac
