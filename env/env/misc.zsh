setopt glob_dots
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

## completions
# always add files to completion options
function _add_files_to_completion() {
    _files
}
compdef _add_files_to_completion -first-

## binds
#vi mode
bindkey  -v
# history-substring
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# completions
bindkey -M menuselect '^[[Z' reverse-menu-complete

# source overrides
if [ -f "$HOME/env/overrides/misc.zsh" ]
then
    source "$HOME/env/overrides/misc.zsh"
fi

source "$HOME/.config/terrainium/terrainium_init"
