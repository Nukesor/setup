#!/bin/sh

# Getting Variables
source ./config.sh

if $crypt; then
    # Filesystem
    cryptsetup -y -v luksFormat ${hdd}p2
    cryptsetup open ${hdd}p2 $cryptname
fi

# Create file systems
echo "y
"|mkfs.ext4 $root
echo "y
"|mkfs.msdos -F 32 $boot

#Mounting
mount $root /mnt
mkdir -p /mnt/boot
mount $boot /mnt/boot

# Create required directories
mkdir -p /mnt/run
mkdir -p /mnt/run/shm
