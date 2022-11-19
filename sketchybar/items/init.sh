#!/usr/bin/env sh
source "$CONFIG_DIR/colors.sh"

sketchybar --set space_display \
	label="1" \
	label.color=$ACCENT1 \
	icon.drawing=off \
	script="$PLUGIN_DIR/space.sh"

sketchybar --set focused_window \
	label="~" \
	label.color=$ACCENT1 \
	icon.drawing=off \
	script="$PLUGIN_DIR/front_app.sh"

sketchybar --set wifi \
	script="$PLUGIN_DIR/wifi.sh" \
	update_freq=1

sketchybar --set battery \
	script="$PLUGIN_DIR/battery.sh" \
	update_freq=10

sketchybar --set sound \
	script="$PLUGIN_DIR/sound.sh"

# vpn item
source "$CONFIG_DIR/items/vpn.sh"
