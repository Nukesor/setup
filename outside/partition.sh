#!/bin/sh

# Getting Variables
source ./config.sh

# Formatting
echo "o
y
n


+400M
ef00
n




c
1
$bootlabel
c
2
$label
w
y
"| gdisk $hdd;
