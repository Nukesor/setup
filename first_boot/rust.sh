#!/bin/bash
set -euo pipefail

rustup default stable
rustup component add rustfmt-preview
rustup component add rls-preview rust-analysis rust-src
