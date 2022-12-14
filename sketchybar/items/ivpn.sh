#!/usr/bin/env bash
sketchybar --add item vpn right

sketchybar --set vpn \
	icon.drawing=on \
	script="$PLUGIN_DIR/pvpn.sh" \
	click_script="sketchybar -m --set \$NAME popup.drawing=toggle" \
	popup.background.corner_radius=5 \
	popup.background.border_width=2 \
	popup.background.border_color=$FOREGROUND \
	popup.align=right \
	popup.y_offset=-3 \
	update_freq=5

sketchybar --subscribe vpn system_woke mouse.entered mouse.exited.global

sketchybar --add item vpn.connect popup.vpn \
	--set vpn.connect icon=$VPN_CONNECTED \
	icon.drawing=on \
	label.drawing=on \
	label="connect" \
	background.padding_left=10 \
	background.padding_right=10 \
	click_script="$HOME/bin/vpn-manager connect; sketchybar -m --set vpn popup.drawing=off"

sketchybar --add item vpn.disconnect popup.vpn \
	--set vpn.disconnect icon=$VPN_DISCONNECTED \
	icon.drawing=on \
	label.drawing=on \
	label="disconnect" \
	background.padding_left=10 \
	background.padding_right=10 \
	click_script="$HOME/bin/vpn-manager disconnect; sketchybar -m --set vpn popup.drawing=off"

sketchybar --add item vpn.ui popup.vpn \
	--set vpn.ui icon=$OPEN \
	icon.drawing=on \
	label.drawing=on \
	label="ui" \
	background.padding_left=10 \
	background.padding_right=10 \
	click_script="$HOME/bin/vpn-manager ui; sketchybar -m --set vpn popup.drawing=off"
