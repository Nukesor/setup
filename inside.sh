#!/bin/bash

set -euo pipefail

./inside/base.sh
./inside/efi.sh
./inside/pkg.sh
./inside/user.sh
./inside/aur.sh
./inside/system.sh
