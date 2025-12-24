# dotfiles

<p align="center" width="100%">
<img src="./screenshots/neofetch.png" alt="neofetch" width="65%" />
</p>

dotfiles for my work machine, a macbook pro with the apple m4 pro chipset running macos tahoe.

## quickstart

ensure that the xcode command line tools are installed:

```sh
xcode-select --install
```

then, run the setup script to get a list of available commands:

```sh
./scripts/setup.sh
```

```sh
USAGE: setup.sh [COMMAND]
       setup.sh [-h | --help]

COMMANDS:
  i, install    Install system packages and fonts
  s, stow       Run GNU Stow to activate symlinks
```

## applications not managed with homebrew

- xcode
