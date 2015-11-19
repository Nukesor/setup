#!/bin/sh

# Getting Variables
source ./config.sh

# Formatting
echo "o
y
n


+500M
ef00
n




c
2
$label
w
y
"| gdisk $hdd;

