#!/usr/bin/env bash

if ! [ $(id -u) = 0 ]; then
    echo "This script must be run as root."; exit 1
fi

# Output a list of installed packages (Arch + AUR)
create_pkglist() {
    echo "Creating pkglist.txt..."
    pacman -Qqe > pkglist.txt
}

# Install packages from pkglist, excluding AUR and up-to-date packages
install_pkglist() {
    echo "Installing from pkglist.txt..."
    pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))
}

main() {
    while getopts ":ci" flag; do
        case $flag in
            c ) create_pkglist; return 0 ;;
            i ) install_pkglist; return 0 ;;
            ? ) echo "Select an option."; return 1 ;;
        esac
    done
    shift $(( OPTIND - 1 ))

    (( $# < 1 )) && echo "Select an option."; return 1
}

main "$@"
