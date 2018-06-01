#!/bin/bash

# Add yay
su -c "git clone https://aur.archlinux.org/yay.git /tmp/yay" nuke
su -c "cd /tmp/yay && makepkg" nuke
pacman -U /tmp/yay/*.tar.xz --noconfirm
