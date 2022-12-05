#!/usr/bin/env bash
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

space=$(yabai -m query --spaces --space | jq -r ".index")
ids=$(yabai -m query --windows --space | jq -r ".[].id")
if [ "$ids" != "" ]; then
	while IFS= read -r window; do
		app=$(yabai -m query --windows --window $window | jq -r ".app")
		sketchybar --set $window \
			label="$($HOME/.config/sketchybar/plugins/picon_map.sh "$app")" \
			label.drawing=on \
			label.font="sketchybar-app-font:Regular:16.0" \
			label.color=$FOREGROUND \
			label.highlight=off \
			associated_space=$space \
			click_script="yabai -m window --focus $window"
	done <<<"$ids"
fi
