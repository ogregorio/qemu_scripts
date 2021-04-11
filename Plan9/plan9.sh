#!/bin/sh

QEMU_x86_BIN="/usr/bin/qemu-system-x86_64"
QEMU_x86_VIRGIL="/var/lib/snapd/snap/bin/qemu-virgil"
PLAN9_IMAGE="plan9.iso"
TOTAL_MEMORY="64"

#
# Created by Arthur Gregório | Chimps and Chips | 2021 | MIT Licensed
#

#Function to boot from PLAN9 ISO
BootCD() {
echo "Booting from CD..."
$QEMU_x86_BIN -machine kernel_irqchip=off -boot d -enable-kvm -soundhw pcspk -smp 3 -m $TOTAL_MEMORY -cdrom $PLAN9_IMAGE -hda plan9.qcow2

}

#Function to boot from virtual Hard Disk
BootHD() {
echo "Booting Plan9 from HD..."
$QEMU_x86_BIN -machine kernel_irqchip=off -boot d -enable-kvm -soundhw pcspk -smp 3 -m $TOTAL_MEMORY -hda plan9.qcow2

}

#Function to boot from virtual Hard Disk with Virgil
BootHD() {
echo "Booting Plan9 from HD..."
$QEMU_x86_VIRGIL -machine kernel_irqchip=off -boot d -enable-kvm -soundhw pcspk -smp 3 -m $TOTAL_MEMORY -hda plan9.qcow2

}

#Function to create a RAW virtual Hard Disk
CreateIMG() {
echo "Creating a Plan9 disk..."
qemu-img create -f qcow2 plan9.qcow2 $1 && echo 'Created with success!'
}

#Help function
Help() {
echo "--create-img 10G	to create a virtual Hard Disk with 10 Gigabytes."
echo "--boot-cd		to boot from ISO and start install."
echo "--boot-hd		to boot from virtual Hard Disk after install."
echo "--help			show help."
}

case $1 in
"--create-img") CreateIMG $2 ;;
"--boot-cd") BootCD ;;
"--boot-hd") BootHD ;;
"--boot-hd-gpu") BootHD ;;
"--help") Help;;
esac
