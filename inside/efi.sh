#!/bin/bash

# Getting Variables
source ./config.sh

pacman -S intel-ucode
bootctl --path=/boot install
cp -r files/loader /boot/

if $crypt; then
    cp -r files/mkinitcpio.conf.efi.crypt /etc/mkinitcpio.conf
else
    cp -r files/mkinitcpio.conf.efi /etc/mkinitcpio.conf
fi

# Set cryptdevice for boot
if $crypt; then
    echo "options		cryptdevice=PARTLABEL=$label:$cryptname:allow-discards root=$root quiet rw" >> /boot/loader/entries/arch.conf
fi

# mkinitcpio creation
mkinitcpio -p linux
bootctl --path=/boot install
