#!/bin/sh

# Getting Variables
source ./config.sh

# Filesystem
echo "y
"|mkfs.ext4 $root
echo "y
"|mkfs.msdos -F 32 $boot

#Mounting
mount $root /mnt
mkdir /mnt/boot
mount $boot /mnt/boot

# Basic install
pacstrap /mnt base
genfstab -p /mnt >> /mnt/etc/fstab

