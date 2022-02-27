#!/bin/bash
set -euo pipefail

source ./config.sh


if ! command -v paru &> /dev/null; then
	# Add paru
	echo "Clone paru"
	su nuke -c "cd /tmp && git clone https://aur.archlinux.org/paru-bin.git /tmp/paru"
	echo "Build paru"
	su nuke -c "cd /tmp/paru && makepkg"
	echo "Install paru"
	pacman -U /tmp/paru/*.pkg.tar.zst --noconfirm
fi

echo "Install aur packages"
while read line; do
    echo "Installing $line"
    su nuke -c "paru -Sy --noconfirm --needed ${line}"
done < ./aur-pkglist
