#!/bin/bash

# Install basic packages
pacman -Syy --noconfirm --needed base btrfs-progs mkinitcpio linux linux-firmware

# Basic configs
cp -r files/etc/* /etc/
chmod 440 /etc/sudoers
