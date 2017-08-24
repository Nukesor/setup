#!/bin/bash

pacman -Sy grub --needed --noconfirm
grub-install --target=i386-pc --recheck --debug $hdd # Hier Device einsetzen
grub-mkconfig -o /boot/grub/grub.cfg

# mkinitcpio creation
mkinitcpio -p linux
