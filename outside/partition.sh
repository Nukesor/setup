#!/bin/sh
set -euo pipefail

# Getting Variables
source ./config.sh

echo "Drive: $hdd"
echo "Boot label: $bootlabel"
echo "Root label: $rootlabel"

echo -n "Execute these changes (y/n)? "
read answer
if [ "$answer" != "${answer#[Nn]}" ] ;then
    exit 1;
fi

# Apply clean GPT table
sgdisk -g -o $hdd

# Create EFI boot partitions
sgdisk -n 1:0:600M -t 1:ef00 $hdd

# Create root partition
sgdisk -n 2:0:0 -t 2:8300 $hdd

# Name partitions
sgdisk -c 1:$bootlabel -c 2:$rootlabel $hdd
