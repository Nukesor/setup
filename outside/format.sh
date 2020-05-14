#!/bin/sh

# Getting Variables
source ./config.sh

if $crypt; then
    # Filesystem
    cryptsetup -y -v luksFormat ${root_partion}
    cryptsetup open ${root_partion} $cryptname
fi

# Create file systems
echo "y
"|mkfs.msdos -F 32 $boot_partition
echo "y
"|mkfs.btrfs -L root $root

#Mounting
mount $root /mnt
mkdir -p /mnt/boot
mount $boot_partition /mnt/boot

# Create required directories
mkdir -p /mnt/run
mkdir -p /mnt/run/shm
