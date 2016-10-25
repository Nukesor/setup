#!/bin/bash

export hdd=/dev/sdb
export label=desktoproot
export bootlabel=desktopboot
export boot=${hdd}1
export root=${hdd}2
export crypt=true

if $crypt; then
    export cryptname=cryptroot
    export root=/dev/mapper/$cryptname
fi
