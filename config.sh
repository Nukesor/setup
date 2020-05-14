#!/bin/bash

pacmanroot=/tmp/root
pacmancache=/tmp/chache

# Basic setup config
export hdd=/dev/sda
export rootlabel=root
export bootlabel=boot
export boot="${hdd}1"
export root="${hdd}2"
export crypt=true

if $crypt; then
    export cryptname=cryptroot
    export root=/dev/mapper/$cryptname
fi

# Inside config
export databases=true
export server=false
export hostname=bomb
