#!/bin/bash

export hdd=/dev/sdb
export label=usbroot
export bootlabel=usbboot
export boot=${hdd}1
export root=${hdd}2
#export root=/dev/mapper/$crypt
