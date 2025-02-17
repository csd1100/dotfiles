Get-Content -Path ".\packages" | ForEach-Object {
    # Process each line
    Write-Output $_
    winget install --id $_
}