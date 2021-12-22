from libqtile import bar, widget

from qcolors import *

bar_size = 50
soft_sep = {'linewidth': 2, 'size_percent': 70,
            'foreground': get_formatted_hex(foreground), 'padding': 7}
special_fonts = {'font': 'Space Mono for Powerline', 'fontsize': 45}
start_end_gap = widget.Sep(linewidth=0, padding=10)

top_bar = bar.Bar(
    [
        start_end_gap,
        widget.Sep(linewidth=0, padding=10),
        widget.TextBox(text='', **special_fonts),
        widget.Sep(**soft_sep),
        widget.CheckUpdates(),
        widget.Prompt(prompt='{prompt}: > '),
        widget.Sep(**soft_sep),
        widget.WindowName(),
        widget.Sep(**soft_sep),
        widget.PulseVolume(fmt=' {}'),
        widget.Sep(**soft_sep),
        widget.Battery(foreground=get_formatted_hex(foreground), low_percentage=0.20,
                       low_foreground=get_formatted_hex(color1), update_delay=10,
                       format=' {percent:.0%}'),
        widget.Sep(**soft_sep),
        widget.Clock(timezone='Asia/Kolkata', format='%B %-d, %H:%M'),
        widget.Sep(**soft_sep),
        widget.Systray(padding=10),
        start_end_gap,
    ],
    bar_size,
    foreground=get_formatted_hex(foreground),
    background=get_formatted_hex(background)
)

bottom_bar = bar.Bar(
    [
        start_end_gap,
        widget.GroupBox(
            **special_fonts,
            highlight_method='text',
            active=get_formatted_hex(color8),
            this_current_screen_border=get_formatted_hex(foreground),
            urgent_alert_method='text',
            urgent_text=get_formatted_hex(color1),
        ),
        widget.Spacer(length=bar.STRETCH),
        widget.Cmus(
            play_color=get_formatted_hex(color2),
            max_chars=40,

        ),
        widget.QuickExit(),
    ],
    bar_size,
    foreground=get_formatted_hex(foreground),
    background=get_formatted_hex(background)
)
