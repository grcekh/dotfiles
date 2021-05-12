#!/usr/bin/env bash

if ! [ $(id -u) = 0 ]; then
    echo "This script must be run as root."; exit 1
fi

print_usage() {
cat << EOM
USAGE:
    ./packages.sh [OPTIONS]
OPTIONS:
    -h Print this message
    -c Create pkglist.txt
    -i Install from pkglist.txt
EOM
}

# Output a list of installed packages
create_pkglist() {
    echo "Creating pkglist.txt..."
    dpkg --get-selections > pkglist.txt
    echo "Done!"
}

# Install packages from pkglist
install_pkglist() {
    echo "Installing from pkglist.txt..."
    # Excluding AUR and up-to-date packages
    # pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))
    dpkg --set-selections < pkglist.txt
    echo "Done!"
}

main() {
    pkglist_dir="/home/grace/dotfiles"
    cd "$pkglist_dir"

    while getopts ":hci" flag; do
        case $flag in
            h ) print_usage; return 0 ;;
            c ) create_pkglist; return 0 ;;
            i ) install_pkglist; return 0 ;;
            ? ) print_usage; return 1 ;;
        esac
    done
    shift $(( OPTIND - 1 ))

    (( $# < 1 )) && print_usage; return 1
}

main "$@"
