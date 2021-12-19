#!/bin/bash
set -euo pipefail

rustup default nightly
rustup component add rustfmt-preview
rustup component add rls-preview rust-analysis rust-src
cargo install cargo-update
