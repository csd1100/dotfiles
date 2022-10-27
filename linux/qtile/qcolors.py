from pywal import colors
from libqtile.log_utils import logger

from hooks import py_wall

pywal_colors = colors.get(py_wall)

logger.warn(py_wall + ":" + str(pywal_colors))

background = pywal_colors['special']['background']
foreground = pywal_colors['special']['foreground']
cursor = pywal_colors['special']['cursor']
color0 = pywal_colors['colors']['color0']
color1 = pywal_colors['colors']['color1']
color2 = pywal_colors['colors']['color2']
color3 = pywal_colors['colors']['color3']
color4 = pywal_colors['colors']['color4']
color5 = pywal_colors['colors']['color5']
color6 = pywal_colors['colors']['color6']
color7 = pywal_colors['colors']['color7']
color8 = pywal_colors['colors']['color8']
color9 = pywal_colors['colors']['color9']
color10 = pywal_colors['colors']['color10']
color11 = pywal_colors['colors']['color11']
color12 = pywal_colors['colors']['color12']
color13 = pywal_colors['colors']['color13']
color14 = pywal_colors['colors']['color14']
color15 = pywal_colors['colors']['color15']

def get_formatted_hex(color_hex):
    return color_hex[1:]
