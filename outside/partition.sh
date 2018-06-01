#!/bin/sh

# Getting Variables
source ./config.sh

# Apply clean GPT table
sgdisk -g -o $hdd

# Create EFI boot partitions
sgdisk -n 1:0:400M -t 1:ef00 $hdd

# Create root partition
sgdisk -n 2:0:0 -t 2:8300 $hdd

# Name partitions
sgdisk -c 1:$bootlabel -c 2:$rootlabel
