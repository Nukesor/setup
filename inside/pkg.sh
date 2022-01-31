#!/bin/bash
set -euo pipefail

source ./config.sh

# Install system packages
pacman -Syy --noconfirm --needed $(cat pkglist)
