#!/bin/bash
set -euo pipefail

source ./config.sh

# Install system packages
pacman -Rns vi --noconfirm
pacman -Syy --noconfirm --needed $(cat pkglist)

# Add paru
su nuke -c "git clone https://aur.archlinux.org/paru.git /tmp/paru"
su nuke -c "cd /tmp/paru && makepkg"
pacman -U /tmp/paru/*.pkg.tar.zst --noconfirm

# Install aur packages
while read line; do
    echo $line
    su nuke -c "paru -Sy --noconfirm --needed ${line}"
done < ./aur-pkglist
