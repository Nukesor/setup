#!/bin/sh

# Basic install
pacstrap /mnt base linux linux-firmware
genfstab -L /mnt >> /mnt/etc/fstab
