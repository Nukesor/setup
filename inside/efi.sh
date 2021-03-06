#!/bin/bash

# Getting Variables
source ./config.sh

pacman -S intel-ucode --noconfirm
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
