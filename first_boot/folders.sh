#!/bin/bash
set -euo pipefail

# Fix any permissions problems that were introduced during setup
sudo chown nuke:nuke -R $HOME/

mkdir -p $HOME/.config
mkdir -p $HOME/.cache/fasd
mkdir -p $HOME/.local/share/zsh
