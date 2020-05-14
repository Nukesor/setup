#!/bin/bash
source ./config.sh

# Install system packages
pacman -Rns vi --noconfirm
pacman -Syy --noconfirm --needed $(cat pkglist)

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

# Rust
rustup default stable

# Docker setup
tee /etc/modules-load.d/loop.conf <<< "loop"

echo $hostname > /etc/hostname

# Services
systemctl enable ntpd.service
systemctl enable tlp.service
systemctl enable tlp-sleep.service
systemctl enable fstrim.timer

# Place configs and rules
cp files/logind.conf /etc/systemd/logind.conf

# Add yay
su -c "git clone https://aur.archlinux.org/yay.git /tmp/yay" nuke
su -c "cd /tmp/yay && makepkg" nuke
pacman -U /tmp/yay/*.tar.xz --noconfirm

# Install aur packages
yay -Sya --devel --noconfirm --needed $(cat aur-pkglist)

if $databases; then
    # Mysql setup
    pacman -S mariadb --noconfirm
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

    # Postgresql  setup
    pacman -S postgresql --noconfirm
    initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'

    systemctl enable mysqld.service
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
