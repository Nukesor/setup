#!/bin/bash
# Copy pacman conf
cp ./files/etc/pacman.conf /etc/

# Install basic packages
pacman -Syy --noconfirm --needed base btrfs-progs mkinitcpio linux linux-firmware

# Basic configs
cp -r files/etc/* /etc/
chmod 440 /etc/sudoers

# Set root password
passwd
