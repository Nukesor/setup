#!/bin/sh
source config.sh

echo "o
y
n


+500M
ef00
n




c
2
root
w
y
"|sudo gdisk $hdd;

cryptsetup -y -v luksFormat $hdd
cryptsetup open $hdd cryptroot

