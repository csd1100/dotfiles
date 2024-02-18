export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    fzf
    kubectl
)

source "$HOME/env/env-vars"
source "$ZSH/oh-my-zsh.sh"
source "$HOME/env/aliases"
source "$HOME/env/functions"
source "$HOME/env/misc"

eval "$(starship init zsh)"

bindkey -v
bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward
