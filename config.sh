#!/bin/bash

pacmanroot=/tmp/root
pacmancache=/tmp/chache

# Basic setup config
export hdd=/dev/sdb
export rootlabel=desktop_root
export bootlabel=desktop_boot
export boot_partition="${hdd}1"
export root_partition="${hdd}2"
export crypt=true

if $crypt; then
    export cryptname=cryptroot
    export root=/dev/mapper/$cryptname
else
    export root=$root_partition
fi


# Inside config
export databases=true
export server=false
export hostname=bomb
