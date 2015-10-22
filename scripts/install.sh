pacman -Rns vi --noconfirm
pacman -Syy --noconfirm --needed $(cat pkglist)
