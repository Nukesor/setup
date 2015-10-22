#!/bin/sh

# Getting Variables
source config.sh

# Variables
boot=$hdd"1"
partition=$hdd"2"

# Formatting
echo "o
y
n


+500M
ef00
n




c
2
root
w
y
"|sudo gdisk $hdd;
echo "YES
"| cryptsetup -y -v luksFormat $partition
cryptsetup open $partition cryptroot

# Filesystem
echo "y
"|mkfs.ext4 /dev/mapper/cryptroot
echo "y
"|mkfs..msdos -F 32 $boot

#Mounting
mount /dev/mapper/cryptroot /mnt
mkdir /mnt/boot
mount $boot /mnt/boot

# Basic install
pacstrap /mnt base
genfstab -p /mnt >> /mnt/etc/fstab

