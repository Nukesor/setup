#!/bin/bash

# Localtime
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# General encoding stuff
echo "en_US.UTF.8 UTF-8" > /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen

# Keymaps
echo "KEYMAP=us" > /etc/vconsole.conf
echo "FONT=ter-112n" >> /etc/vconsole.conf

# Services
systemctl enable ntpd.service

# Downloading zsh and setting it as default shell
chsh -s /usr/bin/zsh

# Add yaourt
pacman -Syy yaourt --noconfirm --needed
