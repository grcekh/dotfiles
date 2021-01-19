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
    # Install oh-my-zsh
    # Maybe have to chmod +x run scripts???
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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

setup_polybar() {
    sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
}

install_neovim() {
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
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
    # setup_polybar
    # create_symlinks
}

main "$@"
