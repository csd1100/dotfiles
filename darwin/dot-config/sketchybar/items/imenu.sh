#!/usr/bin/env bash
source "$HOME/.config/sketchybar/icons.sh"
sketchybar --add item menu left
sketchybar --set menu \
	icon.drawing=on \
	icon.color="$ACCENT" \
	icon.background.color="$BACKGROUND2" \
	icon.background.corner_radius=5 \
	icon.padding_left=10 \
	icon.padding_right=10 \
	icon="$APPLE" \
	click_script="skhd -k 'cmd - s'"
