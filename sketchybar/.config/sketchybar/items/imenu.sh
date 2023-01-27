#!/usr/bin/env bash
sketchybar --add item menu left
sketchybar --set menu \
	icon.drawing=on \
	icon.color="$ACCENT" \
	icon.background.color="$BACKGROUND1" \
	icon.font="Iosevka Nerd Font Mono:Regular:23.0" \
	icon.padding_left=10 \
	icon.padding_right=10 \
	icon="" \
	click_script="skhd -k 'cmd - s'"
