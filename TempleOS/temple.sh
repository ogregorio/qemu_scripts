#!/bin/sh

QEMU_i386_BIN="/var/lib/snapd/snap/bin/qemu-virgil"
TEMPLE_IMAGE="TempleOS.iso"
TOTAL_MEMORY="2048"

#
# Created by Arthur Gregório | Chimps and Chips | 2021 | MIT Licensed
#

#Function to boot from temple ISO
BootCD() {
echo "Booting from CD..."
$QEMU_i386_BIN -machine kernel_irqchip=off -boot d -enable-kvm -soundhw pcspk -smp 3 -m $TOTAL_MEMORY -cdrom $TEMPLE_IMAGE -hda temple.qcow

}

#Function to boot from virtual Hard Disk
BootHD() {
echo "Booting temple from HD..."
$QEMU_i386_BIN -machine kernel_irqchip=off -boot d -enable-kvm -soundhw pcspk -smp 3 -m $TOTAL_MEMORY -hda temple.qcow

}

#Function to create a RAW virtual Hard Disk
CreateIMG() {
echo "Creating a temple disk..."
qemu-img create -f qcow temple.qcow $1 && echo 'Created with success!'
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
"--help") Help;;
esac
