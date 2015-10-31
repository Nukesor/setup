#!/bin/sh

# Getting Variables
source ./config.sh

# Variables
boot=$hdd"1"
partition=$hdd"2"

# Formatting
echo "o
y
n


+500M
ef00
n




c
2
$crypt
w
y
"|sudo gdisk $hdd;

