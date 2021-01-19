#!/usr/bin/env bash

# Check if second monitor is connected

# Start second monitor and set resolution
xrandr --output DP-2 --auto --mode 1920x1080 --right-of LVDS-2

# Turn off second monitor
# xrandr --output DP-2 --off

#main() {
# }

#main "$@"
