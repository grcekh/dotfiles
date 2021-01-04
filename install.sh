#!/usr/bin/env bash

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

install_xcode_tools() {
  (( silent )) || printf "🛠  Installing Xcode tools..\n"
  sudo softwareupdate -i -a
  xcode-select --install
  (( silent )) || printf "🛠  Done!\n"
}

install_ohmyzsh() {
  (( silent )) || printf "✨ Installing oh-my-zsh...\n"
  curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  chsh -s $(which zsh)
  (( silent )) || printf "✨ Done!\n"
}

install_homebrew() {
  (( silent )) || printf "🍺 Installing Homebrew...\n"
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
  (( silent )) || printf "🍺 Done!\n"

  (( silent )) || printf "🍺 Installing formulae...\n"
  brew bundle
  (( silent )) || printf "🍺 Done!\n"
}

setup_python() {
  (( silent )) || printf "🐍 Setting up Python...\n"
  # python -m pip --version
  (( silent )) || printf "🐍 Done!\n"
}

install_vim_extras() {
  (( silent )) || printf "⌨️  Installing vim-plug...\n"
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | bash
  (( silent )) || printf "⌨️  Done!\n"

  (( silent )) || printf "⌨️  Installing Neovim providers...\n"
  python3 -m pip install --user --upgrade pynvim
  (( silent )) || printf "⌨️  Done!\n"
}

create_symlinks() {
  (( silent )) || printf "📂 Creating symlinks...\n"

  cp "$PWD/iterm2/com.googlecode.iterm2.plist" "$HOME/Library/Preferences/"
  ln -si "$PWD/oh-my-zsh/custom/themes/robbyrussellmod.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/robbyrussellmod.zsh-theme"

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

  while getopts ":hs" flag; do
    case $flag in
      h ) print_usage; return 0 ;;
      s ) silent=1 ;;
      ? ) print_usage; return 1 ;;
    esac
  done
  shift $(( OPTIND - 1 ))

  # TODO: While script is running, prevent computer from going to sleep

  install_xcode_tools
  install_ohmyzsh
  install_homebrew
  setup_python
  install_vim_extras
  create_symlinks
}

main "$@"
