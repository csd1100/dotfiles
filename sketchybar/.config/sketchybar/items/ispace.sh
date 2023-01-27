#!/usr/bin/env bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

# Destroy space on right click, focus space on left click.
# New space by left clicking separator (>)

sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"; do
	sid=$(($i + 1))
	sketchybar --add space space.$sid left \
		--set space.$sid associated_space=$sid \
		padding_left=0 \
		padding_right=0 \
		icon=${SPACE_ICONS[i]} \
		icon.padding_left=10 \
		icon.padding_right=10 \
		icon.drawing=on \
		label.padding_right=20 \
		icon.highlight_color=$ACCENT \
		label.background.drawing=on \
		label.background.color=$BACKGROUND2 \
		label.background.corner_radius=0 \
		label.drawing=off \
		script="$PLUGIN_DIR/pspace.sh" \
		--subscribe space.$sid mouse.clicked
done
