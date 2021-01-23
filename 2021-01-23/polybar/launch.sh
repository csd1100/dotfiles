#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -c=/home/chaitanya/.config/polybar/config.top --reload top &
    MONITOR=$m polybar -c=/home/chaitanya/.config/polybar/config.bottom  --reload bottom &
  done
else
  polybar -c=/home/chaitanya/.config/polybar/config.top --reload  top &
  polybar -c=/home/chaitanya/.config/polybar/config.bottom --reload bottom &
fi
echo "Polybar launched..."
