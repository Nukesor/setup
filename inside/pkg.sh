#!/bin/bash
set -euo pipefail
source ./config.sh

echo "Starting pkg setup step"
# Install system packages
pacman -Syy --noconfirm --needed $(cat pkglist)

echo "Finished pkg setup step"
