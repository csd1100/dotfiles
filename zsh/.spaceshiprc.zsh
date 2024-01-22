SPACESHIP_PROMPT_ORDER=(
    user          # Username section
    dir           # Current directory section
    async
    git           # Git section (git_branch + git_status)
    exec_time     # Execution time
    nix_shell
    line_sep      # Line break
    exit_code     # Exit code section
    vi_mode
    char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
    ansible
    docker
    docker_compose
    venv          # virtualenv section
    conda         # conda virtualenv section
    node
    golang
    java
    rust
    package
    time          # Time stamps section
)

# sections
SPACESHIP_TIME_SHOW=true
SPACESHIP_PACKAGE_SHOW=true
SPACESHIP_VENV_SHOW=true
SPACESHIP_CONDA_SHOW=true
SPACESHIP_NODE_SHOW=true
SPACESHIP_GOLANG_SHOW=true
SPACESHIP_JAVA_SHOW=true
SPACESHIP_RUST_SHOW=true
SPACESHIP_RUST_VERBOSE_VERSION=true
SPACESHIP_ANSIBLE_SHOW=true
SPACESHIP_DOCKER_SHOW=true
SPACESHIP_DOCKER_COMPOSE_SHOW=true

# Icons
SPACESHIP_JAVA_SYMBOL=
SPACESHIP_GOLANG_SYMBOL=
SPACESHIP_NODE_SYMBOL=󰎙
SPACESHIP_DOCKER_COMPOSE_SYMBOL=
SPACESHIP_DOCKER_SYMBOL=
SPACESHIP_RUST_SYMBOL=


# vi_mode
spaceship_vi_mode_enable
SPACESHIP_VI_MODE_INSERT=I
SPACESHIP_VI_MODE_NORMAL=N
SPACESHIP_VI_MODE_COLOR=green
SPACESHIP_VI_MODE_SUFFIX=" "
