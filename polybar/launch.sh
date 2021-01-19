#!/usr/bin/env sh

# Add this to your wm startup file.
# TODO: Launch polybar for each display
# https://github.com/polybar/polybar/issues/763

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar for each connected monitor
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    # MONITOR=$m polybar --reload main &
    MONITOR=$m polybar -c ~/.config/polybar/config.ini main &
  done
else
  # polybar --reload main &
  polybar -c ~/.config/polybar/config.ini main &
fi
