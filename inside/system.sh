#!/bin/bash
set -euo pipefail

source ./config.sh

echo "Starting system setup"

# TODO: This stuff needs to be called before the bois setup.
# <------------------------ From here
echo $hostname >/etc/hostname

# Localtime
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

if [[ $_language == "en" ]]; then
    # General encoding stuff
    echo "en_US.UTF.8 UTF-8" >/etc/locale.gen
    echo "LANG=en_US.UTF-8" >/etc/locale.conf
    locale-gen

    # Keymaps
    echo "KEYMAP=us" >/etc/vconsole.conf
elif [[ $_language == "de" ]]; then
    # General encoding stuff
    echo "de_DE.UTF.8 UTF-8" >/etc/locale.gen
    echo "LANG=de_DE.UTF-8" >/etc/locale.conf
    locale-gen

    # Keymaps
    echo "KEYMAP=de-latin1" >/etc/vconsole.conf
else
    echo "Got unknown language ${_language}"
    exit 1
fi

echo "FONT=ter-112n" >>/etc/vconsole.conf

# Setting zsh as as default shell
chsh -s /usr/bin/zsh

# Rust
rustup default stable

# Docker setup
tee /etc/modules-load.d/loop.conf <<<"loop"
# <------------------------ To here

# Services
# TODO: This will be handled by bois at some boint
# <------------------------ From here
systemctl enable systemd-networkd.service
systemctl enable systemd-resolved.service
systemctl enable systemd-timesyncd.service
systemctl enable iwd.service

# Lightdm
systemctl enable lightdm

if $databases; then
    echo "Starting database setup"
    # Postgresql  setup
    pacman -S postgresql --noconfirm
    sudo -u postgres initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'

    systemctl enable postgresql.service
fi
# <------------------------ To here

echo "Finished system setup"
