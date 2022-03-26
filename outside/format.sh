#!/bin/sh
set -euo pipefail
source ./config.sh

# Make sure both partitions actually exist
if [[ ! -b "$boot_partition" ]]; then
    echo "Drive $boot_partition doesn't exist. Aborting."
    exit 1
fi
if [[ ! -b "$root_partition" ]]; then
    echo "Drive $boot_partition doesn't exist. Aborting."
    exit 1
fi

if $crypt; then
    echo "Encrypting root partition."
    echo $root_partition
    cryptsetup --verify-passphrase --verbose luksFormat $root_partition
    cryptsetup open $root_partition $cryptname
fi

# Create file systems
echo "y
"|mkfs.msdos -F 32 $boot_partition
echo "y
"|mkfs.btrfs --label root $root

#Mounting
mount -o compress-force=zstd:3 -o discard=async $root /mnt
mkdir -p /mnt/boot
mount $boot_partition /mnt/boot

# Create required directories
mkdir -p /mnt/run
mkdir -p /mnt/run/shm
