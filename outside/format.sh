#!/bin/sh

# Getting Variables
source ./config.sh

if $crypt; then
    # Filesystem
    cryptsetup -y -v luksFormat ${hdd}2
    cryptsetup open ${hdd}2 $cryptname
fi

# Filesystem
echo "y
"|mkfs.ext4 $root
echo "y
"|mkfs.msdos -F 32 $boot


#Mounting
mount $root /mnt
mount $boot /mnt/boot

# Create required directories
mkdir -p /mnt/run
mkdir -p /mnt/run/shm
