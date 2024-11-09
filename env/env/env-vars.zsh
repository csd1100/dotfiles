GPG_TTY=$(tty)
export GPG_TTY

# default editor
export EDITOR=nvim

# spaceship prompt zsh
export RPS1="%{$reset_color%}"

# DOCKER PS FORMAT
export DOCKER_FORMAT="\\nID\\t{{.ID}}\\nIMAGE\\t{{.Image}}\\nCOMMAND\\t{{.Command}}\\nCREATED\\t{{.RunningFor}}\\nSTATUS\\t{{.Status}}\\nPORTS\\t{{.Ports}}\\nNAMES\\t{{.Names}}\\n"

# GO
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

# pnpm
export PNPM_HOME="/home/user/.local/share/pnpm"

# PATH
path=(
    ~/bin/helpers
    ~/bin
    ~/.local/bin
    $GOBIN
    ~/.volta/bin
    ~/.cargo/bin
    $PNPM_HOME
    /usr/local/go/bin
    $path
)

# CONFIG
export CONFIG="$HOME/.config"

# ssh-agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# custom completions
fpath=(
    ~/env/completions
    ~/zsh/zsh-completions/src
    $fpath
)

# zsh vi-mode disable clipboard
# export VI_MODE_DISABLE_CLIPBOARD="true"

# source overrides
if [ -f "$HOME/env/overrides/env-vars.zsh" ]
then
    source "$HOME/env/overrides/env-vars.zsh"
fi
