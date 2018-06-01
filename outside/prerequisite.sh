#!/bin/bash

source ./config.sh

# Install requirements to ram, as we might not have a writable fs.
mkdir -p $pacmanroot
mkdir -p $pacmancache

pacman --cachedir $pacmancache --root $pacmanroot -Sy --noconfirm --needed make git dosfstools gptfdisk base-devel
