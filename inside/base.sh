#!/bin/bash
set -euo pipefail

# Basic configs
cp -r files/etc/* /etc/
chmod 440 /etc/sudoers

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
    podman \
    lvm2

# Set root password
passwd
