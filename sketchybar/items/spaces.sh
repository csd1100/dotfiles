CONFIG_DIR="$HOME/.config/sketchybar/"
source "$CONFIG_DIR/colors.sh"

readonly background_height=40
readonly icon_padding=25
readonly border_width=2
readonly corner_radius=20

ACCENT=$ACCENT2
BORDER=$ACTIVE_BORDER2
SPACE_ICONS=("" "" "" "" "")

for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space space.$sid left                                                \
             --set space.$sid associated_space=$sid                                     \
                             script="$PLUGIN_DIR/space.sh"                              \
                             icon=${SPACE_ICONS[i]}                                     \
                             icon.padding_left=$icon_padding                            \
                             icon.padding_right=$icon_padding                           \
                             icon.color=$FOREGROUND                                     \
                             icon.highlight_color=$ACCENT                               \
                             label.drawing=off                                          \
                             background.drawing=off                                     \
                             click_script="yabai -m space --focus $sid"
done

sketchybar --add bracket primary_spaces space.1 space.2 space.3 space.4 space.5         \
           --set primary_spaces background.color=$BACKGROUND                            \
                                background.height=$background_height                    \
                                background.corner_radius=$corner_radius                 \
                                background.border_width=$border_width                   \
                                background.border_color=$BORDER
