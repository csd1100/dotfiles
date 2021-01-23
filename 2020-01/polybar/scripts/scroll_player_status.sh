
#!/bin/bash

# see man zscroll for documentation of the following parameters
/home/chaitanya/anaconda3/bin/zscroll -l 30 \
        --delay 0.1 \
        --match-command "playerctl -a status" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true '/home/chaitanya/.config/polybar/scripts/get_player_status.sh' &

wait