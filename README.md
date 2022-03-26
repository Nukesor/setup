#Setup

This is a collection of scripts for setting up an Arch Linux instance.

## Execution Order:

1. Select your device and names in config.sh  
2. Make sure there is an gpt on your device  
3. Run `outside.sh` partition, encryt, format and install arch to the selected hard drive. Make sure you use EFI boot.  
4. `arch-chroot` into the installation.
5. Execute `inside.sh`.
6. Boot into installation
7. Run `first_boot.sh` as your main user.

# Cargo 

```
cargo install cargo-update
```

## Nvidia setup

- Install `nvidia` and `nvidia-lts` (if needed)

## Laptop Setup

### Disable Intel Temperature CPU throttling 

- Install `throttled`
- Start and enable `lonovo_fix.service`
