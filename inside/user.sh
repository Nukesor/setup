#!/bin/bash
set -euo pipefail
source ./config.sh

# Set groups and homedir
groupadd nuke
useradd -d /home/nuke -g nuke nuke
# Set nuke password
passwd nuke

# Create base user for aur stuff
# Create home dir
mkdir -p /home/nuke
chmod 700 /home/nuke
chown nuke:nuke /home/nuke

groupadd -r autologin
usermod -a -G tty,wheel,uucp,http,video,audio,nuke,network,adbusers,lp,autologin nuke

# Set shell
chsh -s /usr/bin/zsh nuke

# Rustup stuff
sudo -u nuke rustup default stable
sudo -u nuke rustup component add rust-src
