#!/bin/bash
set -euo pipefail

# Copy pacman conf
cp ./files/etc/pacman.conf /etc/

# Install basic packages
pacman -Syy --noconfirm --needed \
    base \
    btrfs-progs \
    mkinitcpio \
    linux \
    linux-firmware \
    sudo \
    rustup \
    docker \
    lvm2

# Basic configs
cp -r files/etc/* /etc/
chmod 440 /etc/sudoers

# Set root password
passwd
