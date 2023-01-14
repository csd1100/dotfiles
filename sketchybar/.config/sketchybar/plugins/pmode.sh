#!/usr/bin/env bash
source "$HOME/.config/sketchybar/colors.sh"

case $MODE in
"brightness")
	COLOR=$Y_LIGHT
	;;
"volume")
	COLOR=$V_LIGHT
	;;
"music")
	COLOR=$B_LIGHT
	;;
"default")
	COLOR=$BACKGROUND
	;;
*)
	COLOR=$BACKGROUND
	;;
esac

sketchybar --bar color=$COLOR