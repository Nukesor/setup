#!/bin/bash
source ./config.sh

# Install system packages
pacman -Rns vi --noconfirm
pacman -Syy --noconfirm --needed $(cat pkglist)

# Add yay
su nuke -c "git clone https://aur.archlinux.org/yay.git /tmp/yay"
su nuke -c "cd /tmp/yay && makepkg"
pacman -U /tmp/yay/*.pkg.tar.xz --noconfirm
pacman -U /tmp/yay/*.pkg.tar.zst --noconfirm

# Install aur packages
while read line; do
    echo $line
    su nuke -c "yay -Sy --noconfirm --needed ${line}"
done < ./aur-pkglist
