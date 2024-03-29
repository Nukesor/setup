#!/bin/bash
set -euo pipefail

source ./config.sh

echo "Starting system setup"

# Localtime
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

if [[ $_language == "en" ]]; then
    # General encoding stuff
    echo "en_US.UTF.8 UTF-8" > /etc/locale.gen
    echo "LANG=en_US.UTF-8" > /etc/locale.conf
    locale-gen

    # Keymaps
    echo "KEYMAP=us" > /etc/vconsole.conf
elif [[ $_language == "de" ]]; then
    # General encoding stuff
    echo "de_DE.UTF.8 UTF-8" > /etc/locale.gen
    echo "LANG=de_DE.UTF-8" > /etc/locale.conf
    locale-gen

    # Keymaps
    echo "KEYMAP=de-latin1" > /etc/vconsole.conf
else
    echo "Got unknown language ${_language}"
    exit 1
fi

echo "FONT=ter-112n" >> /etc/vconsole.conf

# Downloading zsh and setting it as default shell
chsh -s /usr/bin/zsh

# Rust
rustup default stable

# Docker setup
tee /etc/modules-load.d/loop.conf <<< "loop"

echo $hostname > /etc/hostname

# Services
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

if $server; then
    echo "Starting server setup"
    mkdir -p /root/.ssh
    chmod 700 /root/.ssh

    mkdir -p "/home/${USERNAME}/.ssh"
    chmod 700 "/home/${USERNAME}/.ssh"

    cp "./files/keys/${USERNAME}.pub" /root/.ssh/authorized_keys
    cp "./files/keys/${USERNAME}.pub" "/home/${USERNAME}/.ssh/authorized_keys"

    chmod 600 /root/.ssh/authorized_keys
    chmod 600 "/home/${USERNAME}/.ssh/authorized_keys"

    cp ./files/sshd_config /etc/ssh/sshd_config

    # SSH setup
    systemctl enable sshd.service
fi

echo "Finished system setup"
