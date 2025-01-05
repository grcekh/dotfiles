# Use nvim as editor if available
set -gx EDITOR vim
command -q nvim && set -gx EDITOR nvim

if test -d "$HOME/.local/bin"
  fish_add_path $HOME/.local/bin
end

#
# Homebrew
#

fish_add_path /opt/homebrew/bin
/opt/homebrew/bin/brew shellenv | source

#
# Python
#

set -gx PIP_REQUIRE_VIRTUALENV true
set -gx PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
pyenv init - | source
