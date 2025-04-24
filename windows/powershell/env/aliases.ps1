function gst() {
    git status $args
}
function gpl() {
    git pull $args
}
function gph() {
    git push $args
}
function gsta() {
    git stash push $args
}
function gstd() {
    git stash drop $args
}
function gstp() {
    git stash pop $args
}
function gcl() {
    git clone $args
}
function gc() {
    git checkout $args
}
function gd() {
    git diff $args
}
function ga() {
    git add $args
}
function gaa() {
    git add -A
}
function gcv() {
    git commit -v $args
}
function gcav() {
    git commit --amend -v $args
}
function gh() {
    git log --oneline --graph $args
}
function glog() {
    git log --graph $args
}

function qq() {
    exit
}

function dps() {
    docker ps --format="$env:DOCKER_FORMAT" $args
}
function dc() {
    docker compose $args
}
function dcup() {
    docker compose up -d $args
}
function dcdn() {
    docker compose down -v $args
}
function dcst() {
    docker compose stop $args
}

function nv() {
    nvim $args
}