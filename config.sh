#!/bin/bash

# Basic setup config
export hdd=/dev/nvme0n1
export rootlabel=bomb_root
export bootlabel=bomb_boot
export boot_partition="${hdd}p1"
export root_partition="${hdd}p2"
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
