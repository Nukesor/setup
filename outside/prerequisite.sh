#!/bin/bash

source ./config.sh

# Install requirements to ram, as we might not have a writable fs.
mkdir -p $pacmanroot/var/lib/pacman
mkdir -p $pacmancache

pacman --cachedir $pacmancache --sysroot $pacmanroot -Sy --noconfirm --needed dosfstools gptfdisk base-devel
