#!/bin/sh

# Getting Variables
source ./config.sh

# Filesystem
echo "y
"|mkfs.ext4 /dev/mapper/$crypt
echo "y
"|mkfs.msdos -F 32 $boot $crypt

#Mounting
mount /dev/mapper/$crypt /mnt
mkdir /mnt/boot
mount $boot /mnt/boot

# Basic install
pacstrap /mnt base
genfstab -p /mnt >> /mnt/etc/fstab

