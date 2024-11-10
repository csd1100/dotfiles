# neovim
alias nv="nvim"

# general
alias l="ls -al"
alias la="ls -a"
alias md="mkdir"
alias :q="exit"
alias :Q="exit"
alias tree='tree -a -I .git'
alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# git
alias gc="git fetch && git checkout"
alias gcl="git clone"
alias gst="git status"
alias gd="git diff"
alias gdt="git difftool"
alias ga="git add"
alias gaa="git add ."
alias gcv="git commit -v"
alias gcav="git commit --amend -v"
alias gsta="git stash add"
alias gstp="git stash pop"
alias gstd="git stash drop"
alias gp="git push"
alias gl="git pull"
alias gh="git log --oneline --graph"
alias glog="git log --graph"

#tmux
# alias tm="tmux"
# alias tps="tmux list-sessions"
# alias tkl="tmux kill-server"

# docker
alias dps="docker ps --format=\$DOCKER_FORMAT"
alias dc="docker-compose"
alias dcps="docker-compose ps"
alias dcup="docker-compose up -d"
alias dcdn="docker-compose down -v"
alias dcst="docker-compose start"
alias dcstp="docker-compose stop"

# kitty kittens
alias s="kitten ssh"
alias d="kitten diff"

# unaliase for bin overrides

# source overrides
if [ -f "$HOME/env/overrides/aliases.zsh" ]
then
    source "$HOME/env/overrides/aliases.zsh"
fi
