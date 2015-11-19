#!/bin/sh

# Getting Variables
source ./config.sh

# Formatting
echo "o
y
n


+2M
ef02
n


+200M

n




c
3
$label
c
2
$bootlabel
w
y

"| gdisk $hdd;

