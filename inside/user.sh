#!/bin/bash
set -euo pipefail
source ./config.sh

echo "Starting user setup"

# Set groups and homedir
groupadd $USERNAME
useradd -d "/home/${USERNAME}" -g $USERNAME $USERNAME
# Set user password
passwd $USERNAME

cp files/etc/sudoers /etc/sudoers

# Create base user for aur stuff
# Create home dir
mkdir -p "/home/${USERNAME}"
chmod 700 "/home/${USERNAME}"
chown $USERNAME:$USERNAME /home/$USERNAME

groupadd -r autologin
usermod -a -G tty,wheel,uucp,http,video,audio,$USERNAME,network,adbusers,lp,autologin $USERNAME

# Set shell
chsh -s /usr/bin/zsh $USERNAME

# Rustup stuff
sudo -u $USERNAME rustup default stable
sudo -u $USERNAME rustup component add rust-src

echo "Finished user setup"
