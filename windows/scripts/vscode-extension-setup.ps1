Get-Content -Path "~/dotfiles/configs/Code/User/extensions" | ForEach-Object {
    # Process each line
    Write-Output $_
    if ((Get-Command "code" -ErrorAction SilentlyContinue) -ne $null) {
        code --install-extension $_
    }
    if ((Get-Command "codium" -ErrorAction SilentlyContinue) -ne $null) {
        codium --install-extension $_
    }
}