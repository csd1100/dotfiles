#!/usr/bin/env bash

sketchybar --add item focused_window center

sketchybar --set focused_window \
	label.drawing=on \
	label.color=$FOREGROUND \
	icon.drawing=off \
	script="$PLUGIN_DIR/pfront_app.sh"

sketchybar --subscribe focused_window front_app_switched

################################################################################

source "$HOME/.config/sketchybar/items/i_init_windows.sh"

sketchybar --add event window_added \
	--add event window_destroyed

sketchybar --add item window_display left

sketchybar --subscribe window_display space_change window_added window_destroyed

sketchybar --set window_display \
	script="$PLUGIN_DIR/pwindow.sh"

################################################################################

sketchybar --add item placeholder center

sketchybar --set placeholder \
	script="$PLUGIN_DIR/pwindow_handler.sh"

sketchybar --subscribe placeholder window_added window_destroyed system_woke
