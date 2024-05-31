#!/bin/bash
set -euo pipefail

# Install basic packages
echo "Install basic packages"
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
echo "Set root password"
passwd
