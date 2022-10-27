from libqtile.config import Screen

from bars import bottom_bar, top_bar

main_screen = Screen(top=top_bar,
                     bottom=bottom_bar)
screens = [main_screen]
