#!/usr/bin/env bash

source "$HOME/.config/sketchybar/items/i_init_windows.sh"

sketchybar --add event window_added \
	--add event window_destroyed \
	--add event window_focus

sketchybar --add item window_display left

sketchybar --subscribe window_display window_added window_destroyed

sketchybar --set window_display \
	script="$PLUGIN_DIR/pwindow.sh"
