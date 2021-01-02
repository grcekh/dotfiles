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

create_symlinks() {
  (( silent )) || printf "📂 Creating symlinks...\n"

  # .config: No such file or directory
  # .oh-my-zsh: No such file or directory
  # File exists
  # File exists
  # File exists

  ln -s "$PWD/oh-my-zsh/custom/themes/robbyrussellmod.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/"

  mkdir "$HOME/.config/nvim"
  ln -s "$PWD/nvim/init.vim" "$HOME/.config/nvim/init.vim"
  ln -s "$PWD/nvim/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"

  ln -s "$PWD/.vimrc" "$HOME/.vimrc"
  ln -s "$PWD/.zshrc" "$HOME/.zshrc"
  ln -s "$PWD/.gitignore" "$HOME/.gitignore"

  (( silent )) || printf "📂 Done!\n"
}

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

main() {
  silent=0

  # DIR=$(dirname "$0")
  # echo "$DIR"

  whoami

  while getopts ":hs" flag; do
    case $flag in
      h ) print_usage; return 0 ;;
      s ) silent=1 ;;
      ? ) print_usage; return 1 ;;
    esac
  done
  shift $(( OPTIND - 1 ))

  # TODO: Confirm y/n -- will override existing files

  install_xcode
  install_ohmyzsh
  install_homebrew
  install_vimplug
  create_symlinks
}

main "$@"
