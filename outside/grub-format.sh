#!/bin/sh

# Getting Variables
source ./config.sh

echo "y
"|mkfs.ext4 ${hdd}2
echo "y
"|mkfs.ext4 ${hdd}3
mount ${hdd}3 /mnt
mkdir /mnt/boot
mount ${hdd}2 /mnt/boot

