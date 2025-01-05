#!/usr/bin/env bash

#
# Automates the process of converting and updating a macOS application icon.
# If a PNG file is provided, it is first converted to Apple ICNS format before
# it is set as the application icon.
#
# Requirements:
# - Node.js (if a PNG file is provided)
#

convert_png_to_icns() {
  local png_path=$1
  # Remove .icns if present
  local icns_name="${2%.icns}"
  npx png2icons "$png_path" "$icns_name" -icns
}

select_icns_file() {
  local icns_files=("$@")
  local num_files=${#icns_files[@]}

  if [ "$num_files" -eq 0 ]; then
    echo "Error: No .icns file found"
    exit 1
  elif [ "$num_files" -eq 1 ]; then
    echo "${icns_files[0]}"
  else
    echo "Multiple .icns files found. Please select the one to replace:"
    for i in "${!icns_files[@]}"; do
      echo "$((i+1)): ${icns_files[$i]}"
    done

    read -p "Enter number (1-$num_files): " selected_index
    if (( selected_index < 1 || selected_index > num_files )); then
      echo "Error: Invalid selection."
      exit 1
    fi

    echo "${icns_files[$((selected_index-1))]}"
  fi
}

main() {
  if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <Application> <icon.(png|icns)>"
    exit 1
  fi

  local app_name="$1"
  local icon_path="$2"

  local app_path="/Applications/${app_name}.app"
  local resources_path="${app_path}/Contents/Resources"
  local extension="${icon_path##*.}"
  local icns_name="${app_name}.icns"

  if [ ! -d "$app_path" ]; then
    echo "Error: Application not found at $app_path"
    exit 1
  fi

  if [ "$extension" = "png" ]; then
    convert_png_to_icns "$icon_path" "$icns_name"
    # Get the full path of the generated ICNS file
    icns_name=$(realpath "./$icns_name")
  elif [ "$extension" = "icns" ]; then
    # Get the full path of the provided ICNS file
    icns_name=$(realpath "$icon_path")
  else
    echo "Error: Unsupported file format. Please provide a PNG or ICNS file."
    exit 1
  fi

  local icns_files=($(ls "$resources_path" | grep ".icns"))
  local target_icns=$(select_icns_file "${icns_files[@]}")
  cp "$icns_name" "${resources_path}/${target_icns}"

  # Delete the icon cache and relaunch Finder and Dock
  rm -f /var/folders/*/*/*/com.apple.dock.iconcache
  rm -rf /var/folders/*/*/*/com.apple.iconservices*
  killall Finder
  killall Dock
}

main "$@"
