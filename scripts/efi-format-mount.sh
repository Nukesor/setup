#!/bin/bash

echo "y
"|mkfs.ext4 /dev/mapper/cryptroot
mount -t ext4 /dev/mapper/cryptroot /mnt

mkdir /mnt/boot
mount /dev/sdc2 /mnt/boot

