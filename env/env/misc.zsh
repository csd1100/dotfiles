setopt glob_dots
setopt extendedglob

source <(fzf --zsh)

## completions
# always add files to completion options
function _add_files_to_completion() {
    _files
}
compdef _add_files_to_completion -first-

# pnpm completions
source ~/env/completions/_pnpm

## binds
# history-substring
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# source overrides
if [ -f "$HOME/env/overrides/misc.zsh" ]
then
    source "$HOME/env/overrides/misc.zsh"
fi

source "$HOME/.config/terrainium/terrainium_init"
