#!/bin/bash

# Getting Variables
source ./config.sh

# Create home dir
mkdir -p /home/nuke

# Set groups and homedir
groupadd nuke
useradd -d /home/nuke -g nuke nuke
usermod -a -G tty,wheel,uucp,http,video,audio,nuke,network,docker nuke

# Set shell
chsh -s /usr/bin/zsh nuke
sudo -u nuke rustup default stable

# Set home dir permissions
chmod 700 /home/nuke
chown nuke:nuke /home/nuke
