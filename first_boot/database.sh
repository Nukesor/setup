#!/bin/bash
set -euo pipefail

# Create postgres user
echo "Creating database user"
sudo -u postgres createuser $USERNAME --interactive
