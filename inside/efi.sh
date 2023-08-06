#!/bin/bash
set -euo pipefail

# Getting Variables
source ./config.sh

# Install microcode updates depending on platform
if [[ $cpu == "intel" ]]; then
    pacman -S intel-ucode --noconfirm
    pacman -S \
        --noconfirm \
        vulkan-intel \
        lib32-vulkan-intel \
        intel-media-driver
if [[ $cpu == "amd" ]]; then
    pacman -S amd-ucode --noconfirm
    pacman -S \
        --noconfirm \
        amdvlk \
        lib32-amdvlk
else
    echo "Got unknown cpu ${cpu}"
    exit 1
fi

bootctl --path=/boot install
cp -r files/loader /boot/

if $crypt; then
    cp -r files/mkinitcpio.conf.efi.crypt /etc/mkinitcpio.conf
else
    cp -r files/mkinitcpio.conf.efi /etc/mkinitcpio.conf
fi

# Set kernel parameter
if $crypt; then
    echo "options		cryptdevice=PARTLABEL=$rootlabel:$cryptname:allow-discards root=$root quiet rw" >> /boot/loader/entries/arch.conf
else
    echo "options		root=PARTLABEL=$rootlabel quiet rw" >> /boot/loader/entries/arch.conf
fi

# mkinitcpio creation
mkinitcpio -p linux
bootctl --path=/boot install
