# Setup

This is a collection of scripts for setting up an Arch Linux instance.

## Execution Order

1. Select your device and names in config.sh
2. Make sure there is an gpt on your device
3. Run `outside.sh` partition, encryt, format and install arch to the selected hard drive. Make sure you use EFI boot.
4. `arch-chroot` into the installation.
5. Execute `inside.sh`.
6. Boot into installation
7. Run `first_boot.sh` as your main user.

## Nvidia setup

- Install `nvidia` and `nvidia-lts` (if needed)

## Laptop Setup

### Disable Intel Temperature CPU throttling

- Install `throttled`
- Start and enable `lonovo_fix.service`

## Nemo

Open folder/file in shell:
```
gsettings set org.cinnamon.desktop.default-applications.terminal exec alacritty
```

## Disable auto-lockout after three attempts

Edit the `/etc/security/faillock.conf`.

```conf
deny = 6
root_unlock_time = 60
```

## Desktop manager

`lightdm` with `lightdm-webkit2-greeter` and **NO** theme.

`/etc/lightdm/lightdm.conf`

```conf
[Seat:*]
...
greeter-session = lightdm-webkit2-greeter
...
```

`/etc/lightdm/lightdm-webkit2-greeter.conf`

```txt
...
webkit_theme        = THEME HERE
...
```

### Autologin

Create autologin group and add user to it.

```sh
groupadd -r autologin
gpasswd -a nuke autologin
```

Adjust the `/etc/lightdm/ligthdm.conf`:

```conf
# Take care to adjust the configs in the [Seat:*] block
[Seat:*]
# Uncomment the following line and set your username
autologin-user=nuke
```
