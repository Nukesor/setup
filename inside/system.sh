#!/bin/bash

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

# Downloading zsh and setting it as default shell
chsh -s /usr/bin/zsh

# Add yay
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg
pacman -U *.tar.xz --noconfirm

# Rust
rustup default nightly

# Docker setup
tee /etc/modules-load.d/loop.conf <<< "loop"

# Services
systemctl enable ntpd.service

if $databases; then
    # Mysql setup
    pacman -S mariadb
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

    # Postgresql  setup
    pacman -S postgresql
    initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'

    systemctl enable mysqld.service
    systemctl enable postgresql.service
fi
