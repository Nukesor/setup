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
    podman

# Set root password
echo "Set root password"
passwd
