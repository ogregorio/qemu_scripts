#!/bin/sh

QEMU_x86_64_BIN="/bin/qemu-system-x86_64"
QEMU_x86_VIRGIL="/var/lib/snapd/snap/bin/qemu-virgil"
DOS_IMAGE="FD12CD.iso"
TOTAL_MEMORY="64"
MAX_CPU="1"

#
# Created by Arthur Gregório | Chimps and Chips | 2021 | MIT Licensed
#

#Function to boot from DOS ISO
BootCD() {
echo "Booting from CD..."
$QEMU_x86_64_BIN -m $TOTAL_MEMORY -smp $MAX_CPU -k en-us -rtc base=localtime -soundhw sb16,adlib -device cirrus-vga -display gtk -hda dos.qcow -cdrom $DOS_IMAGE -boot order=d

}

#Function to boot from virtual Hard Disk
BootHD() {
echo "Booting DOS from HD..."
$QEMU_x86_64_BIN -m $TOTAL_MEMORY -smp $MAX_CPU -k en-us -rtc base=localtime -machine type=pc,accel=kvm -device sb16 -smp 1 -device cirrus-vga -display sdl -hda dos.qcow -drive file=fat:rw:dosfiles/ -boot order=c
}

#Function to boot from virtual Hard Disk with Virgil
BootHDGPU() {
echo "Booting DOS from HD..."
$QEMU_x86_VIRGIL -m $TOTAL_MEMORY -smp $MAX_CPU -k en-us -rtc base=localtime -machine type=pc,accel=kvm -device sb16 -smp 1 -device cirrus-vga -display sdl -hda dos.qcow -drive file=fat:rw:dosfiles/ -boot order=c
}

#Function to create a RAW virtual Hard Disk
CreateIMG() {
echo "Creating a DOS disk..."
qemu-img create -f qcow dos.qcow $1 \
&& echo 'Created with success!' \
|| echo "Failed!"
}

#Help function
Help() {
echo "--create-img 10M	to create a virtual Hard Disk with 10 Megabytes."
echo "--boot-cd		to boot from ISO and start install."
echo "--boot-hd		to boot from virtual Hard Disk after install."
echo "--boot-hd-gpu	to boot from virtual Hard Disk after install with Virgil."
echo "--help			show help."
}

case $1 in
"--create-img") CreateIMG $2 ;;
"--boot-cd") BootCD ;;
"--boot-hd") BootHD ;;
"--boot-hd-gpu") BootHDGPU ;;
"--help") Help;;
esac
