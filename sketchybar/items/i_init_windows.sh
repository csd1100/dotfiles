#!/usr/bin/env bash
windows=$(yabai -m query --windows | jq -c ".[]")

if [ "$windows" != "" ]; then
	while IFS= read -r window; do

		id=$(echo $window | jq -r ".id")
		app=$(echo $window | jq -r ".app")
		space=$(echo $window | jq -r ".space")

		sketchybar --add item $id left
		sketchybar --set $id \
			label="$($HOME/.config/sketchybar/plugins/picon_map.sh "$app")" \
			label.drawing=on \
			label.font="sketchybar-app-font:Regular:13.0" \
			label.color=$FOREGROUND \
			label.highlight=off \
			associated_space=$space \
			click_script="yabai -m window --focus $id"
	done <<<"$windows"
fi
