#Setup

This is a collection of scripts for setting up an Arch Linux instance.

## Execution Order:

1. Select your device and cryptsetup name in config.sh
2. Make sure there is an gpt on your device
3. `make partition`
4. Execute following Code to create an cryptdevice and open it
        cryptsetup -y -v luksFormat $partition
        cryptsetup open $partition $crypt
5. `make format`
6. Chroot in /mnt. Copy the setup directory to mnt before you chroot into it.

7. Adjust your partlabel and cryptdevice in `files/loader/entries/arch.conf`
8. `make install`
9. `su` into your non root user and execute `./inside/yaourt.sh`
