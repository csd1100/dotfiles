#!/usr/bin/env bash
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

space=$(yabai -m query --spaces --space | jq -r ".index")
case $SENDER in
"window_added")
    # reset highlight
	sketchybar --set /window.*/ label.color=$FOREGROUND
	app=$(yabai -m query --windows --window $ID | jq -r ".app")
	sketchybar --add item "window.$ID" left
	sketchybar --set "window.$ID" \
		label="$app" \
		label.drawing=on \
		label.font="Jetbrains Mono:Regular:13.0" \
		label.color=$ACCENT \
		label.highlight=off \
		associated_space=$space \
		click_script="yabai -m window --focus $ID"
	;;
"window_destroyed")
	sketchybar --remove window.$ID
	;;
"window_focus")
    # reset highlight
	sketchybar --set /window.*/ label.color=$FOREGROUND
	sketchybar --set window.$ID label.color=$ACCENT
	;;

esac
