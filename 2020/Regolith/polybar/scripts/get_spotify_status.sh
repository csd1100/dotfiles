#!/bin/bash

if [ "$(playerctl --player=spotify status )" = "Stopped" ]; then
    echo "No music is playing"
elif [ "$(playerctl --player=spotify status )" = "Paused"  ]; then
    polybar-msg -p "$(pgrep -f "polybar now-playing")" hook spotify-play-pause 0 1>/dev/null 2>&1
    playerctl --player=spotify metadata --format "{{ title }} - {{ artist }}"
else # Can be configured to output differently when player is paused
    polybar-msg -p "$(pgrep -f "polybar now-playing")" hook spotify-play-pause 1 1>/dev/null 2>&1
    playerctl --player=spotify metadata --format "{{ title }} - {{ artist }}"
fi