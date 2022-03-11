#!/bin/bash
set -euo pipefail

source ./config.sh

# Localtime
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# General encoding stuff
echo "en_US.UTF.8 UTF-8" > /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen

# Keymaps
echo "KEYMAP=us" > /etc/vconsole.conf
echo "FONT=ter-112n" >> /etc/vconsole.conf

# X11 keymap
localectl --no-convert set-x11-keymap us altgr-intl caps:escape,lv3:ralt_switch,altwin:swap_lalt_lwin

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
systemctl enable iwd.service
systemctl enable ntpd.service
systemctl enable tlp.service

# Symlink resolved.conf
rm /etc/resolv.conf
ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# Place configs and rules
cp files/logind.conf /etc/systemd/logind.conf

if $databases; then
    # Postgresql  setup
    pacman -S postgresql --noconfirm
    sudo -u postgres initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'

    systemctl enable postgresql.service
fi

if $server; then

    mkdir -p /root/.ssh
    chmod 700 /root/.ssh

    mkdir -p /home/nuke/.ssh
    chmod 700 /home/nuke/.ssh

    cp ./files/keys/nuke.pub /root/.ssh/authorized_keys
    cp ./files/keys/nuke.pub /home/nuke/.ssh/authorized_keys

    chmod 600 /root/.ssh/authorized_keys
    chmod 600 /home/nuke/.ssh/authorized_keys

    cp ./files/sshd_config /etc/ssh/sshd_config

    # SSH setup
    systemctl enable sshd.service
fi
