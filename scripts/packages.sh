#!/usr/bin/bash

if ! [ $(id -u) = 0 ]; then
    echo "This script must be run as root."; exit 1
fi

# Output a list of installed packages (Arch + AUR)
pacman -Qqe > pkglist.txt

# Install packages from pkglist, excluding AUR and up-to-date packages
pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))
