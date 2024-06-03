#!/usr/bin/env bash
sketchybar --add item space_display left

sketchybar --subscribe space_display space_change mouse.entered mouse.exited.global

sketchybar --set space_display \
	label.drawing=on \
	icon.drawing=off \
	script="$PLUGIN_DIR/pspace.sh"

spaces=$(yabai -m query --spaces | jq -r ".[].index")

if [ "$spaces" != "" ]; then
	while IFS= read -r space; do
		sketchybar --add item "s$space" left \
			--set "s$space" drawing=off \
			icon=$space \
			icon.drawing=on \
			click_script="yabai -m space --focus $space"
	done <<<"$spaces"
fi
