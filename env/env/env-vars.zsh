GPG_TTY=$(tty)
export GPG_TTY

# history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=1000000000

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
export PNPM_HOME="$HOME/.local/share/pnpm"

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

# zsh history substring search
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=none
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=none
export HISTORY_SUBSTRING_SEARCH_PREFIXED=1

# zsh autosuggest
# export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# source overrides
if [ -f "$HOME/env/overrides/env-vars.zsh" ]
then
    source "$HOME/env/overrides/env-vars.zsh"
fi