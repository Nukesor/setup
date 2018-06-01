#!/bin/bash

pacmanroot=/tmp/root
pacmancache=/tmp/chache

export hdd=/dev/nvme0n1
export rootlabel=root
export bootlabel=boot
export boot=${hdd}1
export root=${hdd}2
export crypt=false

if $crypt; then
    export cryptname=cryptroot
    export root=/dev/mapper/$cryptname
fi
