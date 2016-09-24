#!/bin/sh

# Getting Variables
source ./config.sh

# Formatting
for file in $(ls /dev/sd*) ; do

echo "o
y
n


+2M
ef02
n


+200M

n


+2M
fd00
c
1
bootpartition
w
y
"| gdisk $file;

done
