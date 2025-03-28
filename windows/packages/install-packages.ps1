$wingetPackages = Get-Content -Path ".\winget"
winget install $wingetPackages
$chocoPackages = Get-Content -Path ".\choco"
choco install $chocoPackages