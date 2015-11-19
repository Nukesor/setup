#!/bin/bash

pacman -S intel-ucode
bootctl --path=/boot install
cp -r files/loader /boot/
cp -r files/mkinitcpio.conf.efi /etc/mkinitcpio.conf
