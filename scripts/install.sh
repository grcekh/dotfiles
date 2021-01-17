#!/usr/bin/env bash

# 1. Change default shell to zsh
# chsh -s $(which zsh)

# Install packages via pacman/yay

# Make directories if DNE
# mkdir ~/.config/nvim

# Install oh-my-zsh
# Maybe have to chmod +x run scripts???
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Create symlinks
# ~.i3/config
# ~/.config/kitty/kitty.conf
# ~/.config/nvim/init.vim
# ~/.config/rofi/slate.rasi
# ~/.zshrc

# Polybar
# Install fonts globally(?)
# Move fonts to /usr/share/fonts (system-wide) or ~/.local/share/fonts/ (single user)
# Or download from AUR
# sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
# fc-cache

# Neovim extras
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       #https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# main() {
# }

# main "$@"
