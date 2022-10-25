#!/bin/bash
set -euo pipefail

./first_boot.sh/system.sh
./first_boot.sh/folders.sh
./first_boot.sh/database.sh
./first_boot.sh/rust.sh
