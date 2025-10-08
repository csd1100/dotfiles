
function finder {
    param (
        [string]$Pattern
    )
    $dir = fd -L --full-path --min-depth 1 -d 3 -t d ".*$Pattern.*" "$env:USERPROFILE/work" | fzf
    if (-not [string]::IsNullOrWhiteSpace($dir)) {
        echo "cd $dir"
        cd $dir
    }
}
