#!/usr/bin/env bash
source "$HOME/.config/sketchybar/colors.sh"

update() {
	WIDTH="dynamic"
	HIGHLIGHT="$BACKGROUND1"
	if [ "$SELECTED" = "true" ]; then
		WIDTH="0"
		HIGHLIGHT="$BACKGROUND2"
	fi

	sketchybar --animate tanh 20 --set $NAME icon.background.color="$HIGHLIGHT" icon.highlight=$SELECTED label.width=$WIDTH

}

mouse_clicked() {
	yabai -m space --focus $SID 2>/dev/null
}

case "$SENDER" in
"mouse.clicked")
	mouse_clicked
	;;
*)
	update
	;;
esac
