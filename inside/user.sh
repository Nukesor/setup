#!/bin/bash
source ./config.sh

usermod -a -G tty,wheel,uucp,http,video,audio,nuke,network,docker nuke

# Set shell
chsh -s /usr/bin/zsh nuke
sudo -u nuke rustup default stable

cargo install cargo-watch cargo-outdated cargo-release cargo-update
rustup component add rust-src
