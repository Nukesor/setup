#!/bin/bash

export hdd=/dev/sda
export label=root
export bootlabel=boot
export boot=${hdd}1
export root=${hdd}2
export crypt=true

if $crypt; then
    export cryptname=cryptroot
    export root=/dev/mapper/$cryptname
fi
