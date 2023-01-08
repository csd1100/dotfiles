#!/usr/bin/env bash

case $SENDER in
"mouse.entered")
	sketchybar --set space_display label.drawing=off

	spaces=$(yabai -m query --spaces | jq -r ".[].index")
	if [ "$spaces" != "" ]; then
		while IFS= read -r space; do
			sketchybar --set "s$space" drawing=on
		done <<<"$spaces"
	fi
	;;
*)
	if [ -z "$INFO" ]; then
		LABEL=$(yabai -m query --spaces --space | jq -r ".index")
	else
		LABEL="$(echo $INFO | jq '."display-1"')"
	fi

	sketchybar --set space_display label.drawing=on \
		label="$LABEL"

	spaces=$(yabai -m query --spaces | jq -r ".[].index")
	if [ "$spaces" != "" ]; then
		while IFS= read -r space; do
			sketchybar --set "s$space" drawing=off
		done <<<"$spaces"
	fi
	;;
esac
