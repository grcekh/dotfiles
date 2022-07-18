#!/usr/bin/env bash

#
# Simple bash script for backing up packer.nvim snapshots.
#

main() {
  # SET Attribute Foreground <color>
  local success_color=$(tput setaf 6)
  local error_color=$(tput setaf 9)
  local bold=$(tput bold)
  local reset_attributes=$(tput sgr0)

  local dots_cache_dir="$HOME/dotfiles/cache/nvim/packer.nvim"
  local packer_cache_dir="$HOME/.cache/nvim/packer.nvim"
  
  if [ ! -d "$dots_cache_dir" ]; then
    mkdir -p "$dots_cache_dir"
  fi

  if [ -d "$packer_cache_dir" ]; then
    if [ "$(ls -A $packer_cache_dir)" ]; then
      # The packer.nvim snapshots directory is not empty
      cd "$packer_cache_dir"

      # Read the last modified file in the current working directory
      local latest_snapshot=$(ls -t | head -n1)

      if [[ "$OSTYPE" == "linux-gnu" ]]; then
        local latest_snapshot_date=$(stat -c "%.19y" "$packer_cache_dir/$latest_snapshot")
      elif [[ "$OSTYPE" == "darwin"* ]]; then
        local latest_snapshot_date=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "$packer_cache_dir/$latest_snapshot")
      fi

      echo -e "found the following snapshot:\n"
      echo -e "\tlast modified           name"
      echo -e "\t-------------------     ------"
      echo -e "\t$latest_snapshot_date\t${success_color}$latest_snapshot${reset_attributes}\n"

      # Get confirmation from user; otherwise, abort
      printf "${bold}proceed to overwrite current stable snapshot?${reset_attributes} (y/N) "

      read yn
      case "$yn" in
        [yY][eE][sS]|[yY] )
          mv "$packer_cache_dir/$latest_snapshot" "$dots_cache_dir/stable"
          ln -sfn "$dots_cache_dir/stable" "$packer_cache_dir"
          echo -e "${success_color}${bold}success${reset_attributes}: backed up latest packer.nvim snapshot!"
          return 0
          ;;
        * )
          echo -e "program exited without taking any action."
          return 0
          ;;
      esac

    else
      # The packer.nvim snapshots directory is empty
      echo -e "${error_color}${bold}error${reset_attributes}: no snapshots were found in the packer.nvim cache directory."
      echo -e "= ${bold}help${reset_attributes}: try running the PackerSnapshot command."
      return 1
    fi
  else
    # The packer.nvim snapshots directory does not exist
    echo -e "${error_color}${bold}error${reset_attributes}: the packer.nvim cache directory was not found."
    echo -e "\t--> $packer_cache_dir"
    echo -e "${error_color}\t    ^ this path should match the snapshot_path set in your packer.nvim configuration.${reset_attributes}"
    echo -e "\t= ${bold}help${reset_attributes}: double check that the path is set correctly."
    return 1
  fi
}

main "$@"
