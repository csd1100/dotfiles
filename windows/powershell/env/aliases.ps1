#git
function gst() {
    git status $args
}
function gpl() {
    git pull $args
}
function gpsh() {
    git push $args
}
function gsta() {
    git stash push $args
}
function gstd() {
    git stash drop $args
}
function gsta() {
    git stash apply $args
}
function gstp() {
    git stash pop $args
}
function gcl() {
    git clone $args
}
function gck() {
    git checkout; git checkout $args
}
function gd() {
    git diff $args
}
function gdt() {
    git difftool $args
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

# exit
function qq() {
    exit
}

# docker
function dps() {
    docker ps --format="$env:DOCKER_FORMAT" $args
}
function dc() {
    docker compose $args
}
function dcps() {
    docker compose ps $args
}
function dcup() {
    docker compose up -d $args
}
function dcdn() {
    docker compose down -v $args
}
function dcst() {
    docker compose start $args
}
function dcstp() {
    docker compose stop $args
}

# linux compat
function which {
    (Get-Command $args).Source
}
