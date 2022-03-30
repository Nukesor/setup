#!/bin/bash
set -euo pipefail

# X11 keymap
sudo localectl --no-convert set-x11-keymap us altgr-intl caps:escape,lv3:ralt_switch,altwin:swap_lalt_lwin

# Symlink resolved.conf
sudo rm /etc/resolv.conf
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
