GPG_TTY=$(tty)
export GPG_TTY

# history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=1000000000

# default editor
export EDITOR=nvim

# DOCKER PS FORMAT
export DOCKER_FORMAT="\\nID\\t{{.ID}}\\nIMAGE\\t{{.Image}}\\nCOMMAND\\t{{.Command}}\\nCREATED\\t{{.RunningFor}}\\nSTATUS\\t{{.Status}}\\nPORTS\\t{{.Ports}}\\nNAMES\\t{{.Names}}\\n"


# android studio, golang
if [ $(uname -s) = 'Darwin' ]; then
    export ANDROID_HOME="${HOME}/Library/Android/sdk"
elif [ $(uname -s) = 'Linux' ]; then
    export ANDROID_HOME="${HOME}/Android/sdk"
fi

# PATH
path=(
    ~/bin/helpers
    ~/bin
    ~/.local/bin
    ~/.bun/bin
    ~/.cargo/bin
    "${ANDROID_HOME}/emulator"
    "${ANDROID_HOME}/platform-tools"
    /usr/local/go/bin
    $path
)

# gobin
path=(
  $path
  "$(go env GOPATH)/bin"
)

# CONFIG
export CONFIG="$HOME/.config"

# ssh-agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# custom completions
fpath=(
    ~/env/completions
    ~/zsh/zsh-completions/src
    ~/.rustup/toolchains/stable-*/share/zsh/site-functions
    $fpath
)

if [ $(uname -s) = 'Darwin' ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    fpath=(
        /opt/homebrew/share/zsh/site-functions/
        /opt/homebrew/opt/zsh/share/zsh/functions
        $fpath
    )
fi

# zsh vi-mode disable clipboard
# export VI_MODE_DISABLE_CLIPBOARD="true"

# zsh history substring search
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=none
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=none
export HISTORY_SUBSTRING_SEARCH_PREFIXED=1

# zsh autosuggest
# export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# brew
export HOMEBREW_NO_ANALYTICS=1

# expo
export EXPO_NO_TELEMETRY=1

if [ -f "$HOME/env/private-scripts/env-vars.zsh" ]; then
    source "$HOME/env/private-scripts/env-vars.zsh"
fi

# source overrides
if [ -f "$HOME/env/overrides/env-vars.zsh" ]; then
    source "$HOME/env/overrides/env-vars.zsh"
fi
