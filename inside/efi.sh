#!/bin/bash

# Getting Variables
source ./config.sh

pacman -S intel-ucode
bootctl --path=/boot install
cp -r files/loader /boot/
cp -r files/mkinitcpio.conf.efi /etc/mkinitcpio.conf

# Set cryptdevice for boot
if $crypt; then
    echo "options		cryptdevice=PARTLABEL=$label:$cryptname:allow-discards root=$root quiet rw" >> /boot/loader/entries/arch.conf
fi

# mkinitcpio creation
mkinitcpio -p linux
bootctl --path=/boot install
