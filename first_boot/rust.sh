#!/bin/bash
rustup default nightly
rustup component add rustfmt-preview
rustup component add rls-preview rust-analysis rust-src
cargo install cargo-watch
cargo install cargo-update
cargo install cargo-outdated
cargo install cargo-license
