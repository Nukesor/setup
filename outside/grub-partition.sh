#!/bin/sh

# Getting Variables
source ./config.sh

# Apply clean GPT table
sgdisk -g -o $hdd

# Create BIOS boot partitions
sgdisk -n 1:2048:4095 -t 1:ef02 $hdd

# Create GRUB boot partition
sgdisk -n 2:0:200M -t 2:fd00 $hdd

# Create root partition
sgdisk -n 3:0:0 -t 2:8300 $hdd

# Name partitions
sgdisk -c 2:$bootlabel -c 3:$rootlabel
