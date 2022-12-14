#!/usr/bin/env bash
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

space=$(yabai -m query --spaces --space | jq -r ".index")
case $SENDER in
"window_added")
	app=$(yabai -m query --windows --window $ID | jq -r ".app")
	sketchybar --add item $ID left
	sketchybar --set $ID \
		label="$($HOME/.config/sketchybar/plugins/picon_map.sh "$app")" \
		label.drawing=on \
		label.font="sketchybar-app-font:Regular:13.0" \
		label.color=$FOREGROUND \
		label.highlight=off \
		associated_space=$space \
		click_script="yabai -m window --focus $window"
	;;
"window_destroyed")
	sketchybar --remove $ID
	;;

esac
