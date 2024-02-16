#!/usr/bin/env bash

set -e

GREEN="\033[32m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[34m"
ENDCOLOR="\033[0m"

logger() {
  local type="$1"
  local message="$2"

  case "$type" in
    success)
      color=$GREEN
      label=""
      ;;
    error)
      color=$RED
      label=""
      ;;
    warn)
      color=$YELLOW
      label=""
      ;;
    debug)
      color=$BLUE
      label=""
      ;;
    *)
      color=""
      label=""
      ;;
  esac

  echo -e "${color}${label} ${message}${ENDCOLOR}"
}

log() { logger "info" "$1"; }
log_success() { logger "success" "$1"; }
log_error() { logger "error" "$1"; }
log_warn() { logger "warn" "$1"; }
log_debug() { logger "debug" "$1"; }

have() { command -v "$1" > /dev/null 2>&1; }

did_succeed() {
  local last_status=$?
  if [ $last_status -eq 0 ]; then "$@"; fi
}

# Check if supported OS
OS="$(uname -s | awk '{print tolower($0)}')"

if [ "$OS" != "darwin" ] && [ "$OS" != "linux" ]; then
  log_error "Unsupported operating system: $OS."
  exit 1
fi

SCRIPTS_DIR=$(dirname "${BASH_SOURCE[0]}")
ROOT_DIR="$(cd "$(dirname "$SCRIPTS_DIR")" && pwd)"

# Fonts
FONTS_DIR="$ROOT_DIR/fonts"

# Git
SOURCE="https://github.com/grcekh/dotfiles"
BRANCH="${BRANCH:-main}"

# Ansible
HOSTS="$ROOT_DIR/ansible/hosts"
PLAYBOOK="$ROOT_DIR/ansible/$(echo $OS | awk '{print tolower($0)}').yml"


print_usage() {
cat << EOM
USAGE: setup.sh [COMMAND]
       setup.sh [ -h | --help]

COMMANDS:
  i, install    Install system packages and fonts
  p, packages   Install system packages
  f, fonts      Install system fonts
  a, ansible    Run Ansible playbook
  s, stow       Run GNU Stow to activate symlinks
EOM
}

install_homebrew() {
  if have brew; then
    log "[homebrew] Already installed."
    return 0
  else
    log "[homebrew] Installing..."
  fi

  export NONINTERACTIVE=1
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if have brew; then
    log_success "[homebrew] Installation successful." 
  else
    log_error "[homebrew] Installation failed." 
    return 1
  fi
}

install_packages() {
  log_debug "Installing system packages..."
  install_homebrew
}

install_fonts() {
  log_debug "Installing fonts..."

  if [[ "$OS" == "darwin" ]]; then
    FONTS_INSTALL_DIR="$HOME/Library/Fonts"
  elif [[ "$OS" == "linux" ]]; then
    FONTS_INSTALL_DIR="$HOME/.local/share/fonts"
    mkdir -p "$FONT_INSTALL_DIR"
  fi

  if [ -d "$FONTS_DIR" ]; then
    cp -R "$FONTS_DIR/"* "$FONTS_INSTALL_DIR"
    log_success "[fonts] Fonts installed successfully."
  else
    log_error "[fonts] Fonts directory does not exist."
    return 1
  fi
}

run_ansible() {
  log_debug "Bootstrapping Ansible..."

  if ! have ansible; then
    if ! have brew; then install_homebrew || return 1; fi

    log "[ansible] Installing..."
    brew install ansible

    if have ansible; then
      log_success "[ansible] Installation successful."
    else
      log_error "[ansible] Installation failed."
      return 1
    fi
  fi


  if [ -d ~/.ansible/collections/ansible_collections/community ]; then
    log "[ansible] Installing community plugins..."
    log_debug "ansible-galaxy collection install community.general"
    # ansible-galaxy collection install community.general
  fi

  log "[ansible] Running playbook..."
  log_debug "ansible-playbook -i $HOSTS $PLAYBOOK --ask-become-pass"
  # ansible-playbook -i $HOSTS $PLAYBOOK --ask-become-pass
}

run_stow() {
  log_debug "Activating symlinks..."

  if ! have stow; then
    if ! have brew; then install_homebrew || return 1; fi

    log "[stow] Installing..."
    brew install stow
  fi

  if [[ "$(pwd)" != "$ROOT_DIR" ]]; then
    cd "$ROOT_DIR"

    if ! did_succeed; then
      log_error "Failed to change directory to $ROOT_DIR."
      exit 1
    fi
  fi

  stow .

  if did_succeed; then
    log_success "[stow] Successfully activated symlinks.";
  else
    log_error "[stow] Failed to activate symlinks.";
    exit 1
  fi
}

main() {
  if [ "$#" -ne 1 ]; then
    print_usage
    exit 1
  fi

  while [ "$#" -gt 0 ]; do
    opt=$1
    case $opt in
      i | install)
        install_packages
        install_fonts
        exit 0
        ;;
      p | packages)
        install_packages
        exit 0
        ;;
      f | fonts)
        install_fonts
        exit 0
        ;;
      a | ansible)
        run_ansible
        exit 0
        ;;
      s | stow)
        run_stow
        exit 0
        ;;
      -h | --help)
        print_usage
        exit 0
        ;;
      *)
        print_usage
        exit 1
        ;;
    esac
    shift
  done
}

main "$@"
