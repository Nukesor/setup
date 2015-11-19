#!/bin/sh

# Basic install
pacstrap /mnt base
genfstab -p /mnt >> /mnt/etc/fstab

