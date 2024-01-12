SPACESHIP_PROMPT_ORDER=(
    user          # Username section
    dir           # Current directory section
    git           # Git section (git_branch + git_status)
    venv          # virtualenv section
    conda         # conda virtualenv section
    async
    exec_time     # Execution time
    line_sep      # Line break
    exit_code     # Exit code section
    vi_mode
    char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  time          # Time stamps section
)
SPACESHIP_TIME_SHOW=true

# vi_mode
spaceship_vi_mode_enable
SPACESHIP_VI_MODE_INSERT=I
SPACESHIP_VI_MODE_NORMAL=N
SPACESHIP_VI_MODE_COLOR=green
SPACESHIP_VI_MODE_SUFFIX=" "
