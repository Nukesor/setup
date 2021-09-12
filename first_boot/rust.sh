#!/bin/bash
rustup default nightly
rustup component add rustfmt-preview
rustup component add rls-preview rust-analysis rust-src
cargo install cargo-update
cargo install cargo-license
