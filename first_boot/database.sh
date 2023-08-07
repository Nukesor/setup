#!/bin/bash
set -euo pipefail
source ./config.sh

# Create postgres user
echo "Creating database user"
sudo -u postgres createuser $USERNAME --interactive
