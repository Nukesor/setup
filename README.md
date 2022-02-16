#Setup

This is a collection of scripts for setting up an Arch Linux instance.

## Execution Order:

1. Select your device and names in config.sh  
2. Make sure there is an gpt on your device  
3. Run either `make outside-efi` or `make outside-grub` to partition, encryt, format and install arch to the selected hard drive.  
    Make sure you use EFI boot, if you want to setup a system using EFI.  
4. `arch-chroot` into the installation.
5. Execute either `make efi` or `make grub` depending on the previous choice.

# Cargo 
cargo install \
    cargo-watch \
    cargo-outdated \
    cargo-release \
    cargo-update \
    sqlx-cli


## Nvidia setup

- Install `nvidia` and `nvidia-lts` (if needed)
- 

## Laptop Setup

### Disable Intel Temperature CPU throttling 

- Install `throttled`
- Start and enable `lonovo_fix.service`
