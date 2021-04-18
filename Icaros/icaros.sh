#!/bin/sh

QEMU_x86_BIN="/usr/bin/qemu-system-x86_64"
QEMU_x86_VIRGIL="/var/lib/snapd/snap/bin/qemu-virgil"
ICAROS_IMAGE="icaros-pc-i386.iso"
TOTAL_MEMORY="2048"

#
# Created by Arthur Gregório | Chimps and Chips | 2021 | MIT Licensed
#

#Function to boot from Icaros ISO
BootCD() {
echo "Booting from CD..."
$QEMU_x86_BIN -machine kernel_irqchip=off -boot d -enable-kvm -soundhw pcspk -smp 3 -m $TOTAL_MEMORY -cdrom $ICAROS_IMAGE -hda Icaros.raw -soundhw all

}

#Function to boot from virtual Hard Disk
BootHD() {
echo "Booting Icaros from HD..."
$QEMU_x86_BIN -machine kernel_irqchip=off -boot d -enable-kvm -soundhw pcspk -smp 3 -m $TOTAL_MEMORY -hda Icaros.raw -soundhw all

}

#Function to boot from virtual Hard Disk with Virgil
BootHDGPU() {
echo "Booting Icaros from HD..."
$QEMU_x86_VIRGIL -machine kernel_irqchip=off -boot d -enable-kvm -soundhw pcspk -smp 3 -m $TOTAL_MEMORY -hda Icaros.raw -soundhw all

}

#Function to create a RAW virtual Hard Disk
CreateIMG() {
echo "Creating a Icaros disk..."
qemu-img create -f raw Icaros.raw $1 && echo 'Created with success!'
}

#Help function
Help() {
echo "--create-img 10M	to create a virtual Hard Disk with 10 Megabytes."
echo "--boot-cd		to boot from ISO and start install."
echo "--boot-hd		to boot from virtual Hard Disk after install."
echo "--help			show help."
}

case $1 in
"--create-img") CreateIMG $2 ;;
"--boot-cd") BootCD ;;
"--boot-hd") BootHD ;;
"--boot-hd-gpu") BootHDGPU ;;
"--help") Help;;
esac
