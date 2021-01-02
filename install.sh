#!/usr/bin/env bash

# Note: Homebrew has a lot of issues on a multi-user computer

print_usage() {
cat << EOM
USAGE:
  ./install.sh [OPTIONS]
OPTIONS:
  -h Print this message
  -s Run the script without printing to stdout
EOM
}

# make_dirs() {
#   declare -A dirs=(
#     "$HOME/repos"
#     "$HOME/dotfiles"
#   )

#   for i in "${dirs[@]}"; do
#     mkdir "$i"
#   done
# }

install_xcode() {
  (( silent )) || printf "🛠  Installing Xcode tools..\n"
  sudo softwareupdate -i -a
  xcode-select --install
  (( silent )) || printf "🛠  Done!\n"
}

install_ohmyzsh() {
  (( silent )) || printf "✨ Installing oh-my-zsh...\n"
  curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
  (( silent )) || printf "✨ Done!\n"
}

install_homebrew() {
  (( silent )) || printf "🍺 Installing Homebrew...\n"
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
  (( silent )) || printf "🍺 Done! "

  (( silent )) || printf "🍺 Installing formulae...\n"
  brew bundle
  (( silent )) || printf "🍺 Done!\n"
}

install_vimplug() {
  (( silent )) || printf "⌨️  Installing vim-plug...\n"
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | bash
  (( silent )) || printf "⌨️  Done!\n"
}

install_nvim_providers() {
  # Make sure Python 3.4+ is available in $PATH
  python3 -m pip install --user --upgrade pynvim

  # TODO: Node.js/neovim
}

create_symlinks() {
  (( silent )) || printf "📂 Creating symlinks...\n"

  cp "$PWD/iterm2/com.googlecode.iterm2.plist" "$HOME/Library/Preferences/"
  ln -si "$PWD/oh-my-zsh/custom/themes/robbyrussellmod.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/"

  mkdir -p "$HOME/.config/nvim"
  ln -si "$PWD/nvim/init.vim" "$HOME/.config/nvim/init.vim"
  ln -si "$PWD/nvim/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"

  ln -si "$PWD/.vimrc" "$HOME/.vimrc"
  ln -si "$PWD/.zshrc" "$HOME/.zshrc"
  ln -si "$PWD/.gitignore" "$HOME/.gitignore"

  (( silent )) || printf "📂 Done!\n"
}

main() {
  silent=0

  # DIR=$(dirname "$0")
  # echo "$DIR"

  while getopts ":hs" flag; do
    case $flag in
      h ) print_usage; return 0 ;;
      s ) silent=1 ;;
      ? ) print_usage; return 1 ;;
    esac
  done
  shift $(( OPTIND - 1 ))

  install_xcode
  install_ohmyzsh
  install_homebrew
  install_vimplug
  install_nvim_providers
  create_symlinks
}

main "$@"
