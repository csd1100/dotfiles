#!/usr/bin/env sh
source "$CONFIG_DIR/colors.sh"

sketchybar --set vpn \
	icon= \
	click_script="sketchybar -m --set \$NAME popup.drawing=toggle" \
    popup.background.corner_radius=5 \
	popup.background.border_width=2 \
	popup.background.border_color=$ACTIVE_BORDER1 \
	popup.align=center \
	popup.y_offset=-3

sketchybar --add item vpn.connect popup.vpn \
	--set vpn.connect icon= \
	label="connect" \
	background.padding_left=10 \
	background.padding_right=10 \
	click_script="$HOME/bin/vpn-manager connect;
                                             sketchybar -m --set vpn popup.drawing=off"

sketchybar --add item vpn.disconnect popup.vpn \
	--set vpn.disconnect icon= \
	label="disconnect" \
	background.padding_left=10 \
	background.padding_right=10 \
	click_script="$HOME/bin/vpn-manager disconnect;
                                             sketchybar -m --set vpn popup.drawing=off"

sketchybar --add item vpn.ui popup.vpn \
	--set vpn.ui icon= \
	label="ui" \
	background.padding_left=10 \
	background.padding_right=10 \
	click_script="$HOME/bin/vpn-manager ui;
                                             sketchybar -m --set vpn popup.drawing=off"
