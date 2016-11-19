#Setup

This is a collection of scripts for setting up an Arch Linux instance.

## Execution Order:

1. Select your device and names in config.sh  
2. Make sure there is an gpt on your device

3. Run either `make efi-setup` or `make grub-setup` to format, partition and install arch to the selected hard drive. Make sure used EFI boot, if you want to setup a system using EFI.

4. Boot into the system.
5. Execute either `make efi` or `make grub` depending on the previous choice.
