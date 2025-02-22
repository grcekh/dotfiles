# https://gist.github.com/tommyip/cf9099fa6053e30247e5d0318de2fb9e
# https://github.com/nakulj/auto-venv/blob/main/conf.d/venv.fish

function __auto_source_venv --on-variable PWD --description "Activate or deactivate venv on directory change"
  status --is-command-substitution; and return

  # Check if working directory is a git repository
  if git rev-parse --show-toplevel &>/dev/null
    set dir (realpath (git rev-parse --show-toplevel))
  else
    set dir (pwd -P)
  end

  # Find a virtual environment in the directory
  set VENV_DIR_NAMES env .env venv .venv
  for venv_dir in $dir/$VENV_DIR_NAMES
    if test -e "$venv_dir/bin/activate.fish"
      break
    end
  end

  # Activate venv if it was found and not activated before
  if test "$VIRTUAL_ENV" != "$venv_dir" -a -e "$venv_dir/bin/activate.fish"
    source $venv_dir/bin/activate.fish
    # Deactivate venv if it is activated but the directory doesn't exist
  else if not test -z "$VIRTUAL_ENV" -o -e "$venv_dir"
    deactivate
  end
end

__auto_source_venv
