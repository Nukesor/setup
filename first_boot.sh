#!/bin/bash
set -euo pipefail

./first_boot/folders.sh
./first_boot/system.sh
./first_boot/database.sh
./first_boot/rust.sh
