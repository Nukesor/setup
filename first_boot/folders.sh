#!/bin/bash
set -euo pipefail
source ./config.sh

# Fix any permissions problems that were introduced during setup
sudo chown $USER:$USER -R $HOME/

mkdir -p $HOME/.config
mkdir -p $HOME/.cache/fasd
mkdir -p $HOME/.local/share/zsh
