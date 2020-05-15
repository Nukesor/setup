#!/bin/bash
source ./config.sh

# Create base user for aur stuff
# Create home dir
mkdir -p /home/nuke
chmod 700 /home/nuke
chown nuke:nuke /home/nuke

# Set groups and homedir
groupadd nuke
useradd -d /home/nuke -g nuke nuke
# Set nuke password
passwd nuke

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
