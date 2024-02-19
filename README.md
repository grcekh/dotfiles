# dotfiles

<p align="center" width="100%">
<img src="./screenshots/neofetch.png" alt="neofetch" width="65%" />
</p>

dotfiles for my primary machine, a macbook pro with the apple m2 max chipset running macos sonoma.

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
  p, packages   Install system packages
  f, fonts      Install system fonts
  a, ansible    Run Ansible playbook
  s, stow       Run GNU Stow to activate symlinks
```

## applications not managed with homebrew

- xcode
- [goldendict-ng](https://github.com/xiaoyifang/goldendict-ng)
- [qolibri](https://github.com/mvf/qolibri)

## see also

- [dotfiles for Pop!\_OS](https://github.com/grcekh/dotfiles/tree/pop)
- [dotfiles for Manjaro i3](https://github.com/grcekh/dotfiles/tree/manjaro)
