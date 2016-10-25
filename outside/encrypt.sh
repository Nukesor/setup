#!/bin/sh

# Getting Variables
source ./config.sh

if $crypt; then
    echo "y
    "|mkfs.msdos -F 32 $boot

    cryptsetup -y -v luksFormat ${hdd}2
    cryptsetup open ${hdd}2 $cryptname
    mkfs -t ext4 $root
    mount -t ext4 $root /mnt

    mkdir -p /mnt/run
    mkdir -p /mnt/run/shm
else
    echo "No crypt parameter set. fucky"
    exit 1
fi
