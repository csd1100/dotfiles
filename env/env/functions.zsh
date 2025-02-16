# zsh
function zshedit() {
    pushd ~/dotfiles || exit
    nvim -p ~/dotfiles/common/dot-zshrc ~/env/overrides/*.zsh
    env_compile
    popd || exit
    exec zsh
}

# make directory and change current directory to created directory
function mcd() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories mcd

function helpless() { $* --help | less }

function batman() { man $1 | bat --color always }
compdef batman=man

function finder() {
    dir=$(fd -L --full-path --min-depth 1 -d 3 -t d ".*$1.*" ~ ~/work | fzf)
    if [ ! -z "$dir" ]; then
        echo "cd $dir"
        cd $dir
    fi
}

# docker
function dbash() {
    docker exec -it "$1" bash
    if [ $? != 0 ]; then
        docker exec -it "$1" sh
    fi
}
function _dbash() {
    service=docker
    words=(docker exec -it '')
    CURRENT+=2
    _docker
}
compdef _dbash dbash

function dl() {
    docker logs "$1" | less
}
function _dl() {
    service=docker
    words=(docker logs '')
    CURRENT+=1
    _docker
}
compdef _dl dl

# source overrides
if [ -f "$HOME/env/overrides/functions" ]
then
    source "$HOME/env/overrides/functions"
fi
