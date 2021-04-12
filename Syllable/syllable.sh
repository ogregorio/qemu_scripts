#!/bin/sh

QEMU_x86_VIRGIL="/var/lib/snapd/snap/bin/qemu-virgil"
QEMU_i386_BIN="/usr/bin/qemu-system-i386"
SYLLABLE_IMAGE="Syllable.iso"
TOTAL_MEMORY="2048"

#
# Created by Arthur Gregório | Chimps and Chips | 2021 | MIT Licensed
#

#Function to boot from SYLLABLE ISO
BootCD() {
echo "Booting from CD..."
$QEMU_i386_BIN -machine kernel_irqchip=off -boot d -enable-kvm -soundhw pcspk -smp 3 -m $TOTAL_MEMORY -cdrom $SYLLABLE_IMAGE -hda Syllable.qcow2

}

#Function to boot from virtual Hard Disk
BootHD() {
echo "Booting SYLLABLE from HD..."
$QEMU_i386_BIN -machine kernel_irqchip=off -boot d -enable-kvm -soundhw pcspk -smp 3 -m $TOTAL_MEMORY -hda Syllable.qcow2

}

#Function to boot from virtual Hard Disk with Virgil
BootHDGPU() {
echo "Booting SYLLABLE from HD..."
$QEMU_x86_VIRGIL -machine kernel_irqchip=off -boot d -enable-kvm -soundhw pcspk -smp 3 -m $TOTAL_MEMORY -hda Syllable.qcow2

}

#Function to create a RAW virtual Hard Disk
CreateIMG() {
echo "Creating a SYLLABLEOS disk..."
qemu-img create -f qcow2 Syllable.qcow2 $1 && echo 'Created with success!'
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
"--boot-hd-gpu") BootHDGPU;;
"--help") Help;;
esac
