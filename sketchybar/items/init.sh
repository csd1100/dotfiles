#!/usr/bin/env sh
CONFIG_DIR="$HOME/.config/sketchybar"
source "$CONFIG_DIR/colors.sh"

sketchybar --set space_display \
	label="1" \
	label.drawing=on \
	label.color=$ACCENT1 \
	icon.drawing=off \
	script="$PLUGIN_DIR/space.sh"

sketchybar --set focused_window \
	label="~" \
	label.drawing=on \
	label.color=$ACCENT1 \
	icon.drawing=off \
	script="$PLUGIN_DIR/front_app.sh"

sketchybar --set wifi \
	icon="" \
	label="wifi-status" \
	label.drawing=on \
	icon.drawing=on \
	script="$PLUGIN_DIR/wifi.sh" \
	update_freq=1

sketchybar --set battery \
	icon="" \
	label="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)%" \
	label.drawing=on \
	icon.drawing=on \
	script="$PLUGIN_DIR/battery.sh" \
	update_freq=10

sketchybar --set sound \
	icon="" \
	label="$(osascript -e 'get volume settings' | rg --pcre2 -o "(?<=output volume:)\w+")%" \
	label.drawing=on \
	icon.drawing=on \
	script="$PLUGIN_DIR/sound.sh"

sketchybar --set clock \
	label.drawing=on \
	icon.drawing=on \
	icon= \
	update_freq=10 \
	script="$PLUGIN_DIR/clock.sh"
# vpn item
source "$CONFIG_DIR/items/vpn.sh"
