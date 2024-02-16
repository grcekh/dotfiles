#!/usr/bin/env bash

# Close System Preferences panes to prevent overriding any settings
osascript -e 'tell application "System Preferences" to quit'

sudo -v

# Keep alive; update existing `sudo` timestamp until finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Hide desktop icons
defaults write com.apple.finder CreateDesktop -bool false

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

killall Finder
