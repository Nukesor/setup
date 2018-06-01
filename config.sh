#!/bin/bash

pacmanroot=/tmp/root
pacmancache=/tmp/chache

# Basic setup config
export hdd=/dev/nvme0n1
export rootlabel=root
export bootlabel=boot
export boot="${hdd}p1"
export root="${hdd}p2"
export crypt=false

if $crypt; then
    export cryptname=cryptroot
    export root=/dev/mapper/$cryptname
fi

# Inside config
export databases=false
export server=false
