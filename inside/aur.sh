#!/bin/bash
set -euo pipefail
source ./config.sh

if ! command -v paru &>/dev/null; then
    # Add paru
    echo "Clone paru"
    su $USERNAME -c "cd /tmp && git clone https://aur.archlinux.org/paru-bin.git /tmp/paru"
    echo "Build paru"
    su $USERNAME -c "cd /tmp/paru && makepkg"
    echo "Install paru"
    pacman -U /tmp/paru/*.pkg.tar.zst --noconfirm
fi

sudo useradd --home-dir /var/lib/aur --create-home aur

cp files/sudoers /etc/sudoers
chmod 440 /etc/sudoers
