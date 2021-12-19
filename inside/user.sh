#!/bin/bash
set -euo pipefail

source ./config.sh

# Create base user for aur stuff
# Create home dir
mkdir -p /home/nuke
chmod 700 /home/nuke
chown nuke:nuke /home/nuke

# Set groups and homedir
groupadd nuke
useradd -d /home/nuke -g nuke nuke
# Set nuke password
passwd nuke

usermod -a -G tty,wheel,uucp,http,video,audio,nuke,network,docker nuke

# Set shell
chsh -s /usr/bin/zsh nuke

# Rustup stuff
sudo -u nuke rustup default stable
rustup component add rust-src
