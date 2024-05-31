#!/bin/bash
set -euo pipefail
source ./config.sh

# Create `aur` user that's used for building and installing AUR packages
sudo useradd --home-dir /var/lib/aur --create-home aur

# Give `aur` user permissions to install packages
cp files/sudoers /etc/sudoers
chmod 440 /etc/sudoers

# Install paru from source
if ! command -v paru &>/dev/null; then
    # Add paru
    echo "Clone paru"
    su aur -c "cd /tmp && git clone https://aur.archlinux.org/paru-bin.git /tmp/paru"
    echo "Build paru"
    su aur -c "cd /tmp/paru && makepkg"
    echo "Install paru"
    pacman -U /tmp/paru/*.pkg.tar.zst --noconfirm
fi
