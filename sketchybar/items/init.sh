#!/usr/bin/env sh
CONFIG_DIR="$HOME/.config/sketchybar"
source "$CONFIG_DIR/colors.sh"

sketchybar --set placeholder \
	label.drawing=off \
	icon.drawing=off \
	script="$PLUGIN_DIR/window_handler.sh"
