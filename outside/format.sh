#!/bin/sh

# Getting Variables
source ./config.sh

if $crypt; then
    # Filesystem
    echo $root_partition
    cryptsetup -y -v luksFormat $root_partition
    cryptsetup open $root_partition $cryptname
fi

# Create file systems
echo "y
"|mkfs.msdos -F 32 $boot_partition
echo "y
"|mkfs.btrfs -L root $root

#Mounting
mount -o compress-force=zstd -o discard=async $root /mnt
mkdir -p /mnt/boot
mount $boot_partition /mnt/boot

# Create required directories
mkdir -p /mnt/run
mkdir -p /mnt/run/shm
