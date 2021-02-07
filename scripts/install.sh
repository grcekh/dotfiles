#!/usr/bin/env bash

sudo -v

DOTS="$HOME/dotfiles/"

print_usage() {
cat << EOM
USAGE:
    ./install.sh [OPTIONS]
OPTIONS:
    -h Print this message
EOM
}

install_packages() {
    bash ./packages.sh -i
}

setup_zsh() {
    # zsh
    sudo apt install zsh

    # Oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # TODO: Plugins

    # Change default shell to zsh
    chsh -s $(which zsh)
}

create_symlinks() {
    # TODO: Make directories if DNE
    # mkdir ~/.config/nvim

    # TODO: Check if file already exists
    ln -si "$DOTS/i3/config" "$HOME/.i3/config"
    ln -si "$DOTS/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
    ln -si "$DOTS/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
    ln -si "$DOTS/rofi/slate.rasi" "$HOME/.config/rofi/slate.rasi"
    ln -si "$DOTS/polybar/" "$HOME/.config/"

    ln -si "$DOTS/nvim/init.vim" "$HOME/.config/nvim/init.vim"
    ln -si "$DOTS/nvim/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"
    ln -si "$DOTS/.vimrc" "$HOME/.vimrc"

    ln -si "$DOTS/.zshrc" "$HOME/.zshrc"
}

setup_node() {
    curl -L https://git.io/n-install | bash
}

setup_python() {
    sudo apt install python3-pip python3-venv
}

install_neovim() {
    # VimPlug
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    # Providers
    pip3 install pynvim --upgrade
    npm install -g neovim

    # TODO: Plugins
}

install_nordvpn() {
    sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
}

main() {
    # while getopts ":h" flag; do
    #     case $flag in
    #         h ) print_usage; return 0 ;;
    #         ? ) print_usage; return 1 ;;
    #     esac
    # done
    # shift $(( OPTIND - 1 ))

    # install_packages
    # setup_zsh
    # install_neovim
    # create_symlinks
    # setup_polybar
    install_nordvpn
}

main "$@"
