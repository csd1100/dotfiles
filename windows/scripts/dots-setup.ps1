# powershellrc
New-Item -Path $env:USERPROFILE/Documents/PowerShell/Microsoft.PowerShell_profile.ps1 -ItemType SymbolicLink -Value $env:USERPROFILE/dotfiles/windows/powershell/Microsoft.PowerShell_profile.ps1 -Force
mkdir -Force $env:USERPROFILE/Documents/PowerShell/env
New-Item -Path $env:USERPROFILE/Documents/PowerShell/env/env-vars.ps1 -ItemType SymbolicLink -Value $env:USERPROFILE/dotfiles/windows/powershell/env/env-vars.ps1 -Force
New-Item -Path $env:USERPROFILE/Documents/PowerShell/env/aliases.ps1 -ItemType SymbolicLink -Value $env:USERPROFILE/dotfiles/windows/powershell/env/aliases.ps1 -Force
# .vimrc
New-Item -Path $env:USERPROFILE/.vimrc -ItemType SymbolicLink -Value $env:USERPROFILE/dotfiles/common/dot-vimrc -Force
# neovim
New-Item -Path $env:USERPROFILE/AppData/Local/nvim -ItemType SymbolicLink -Value $env:USERPROFILE/dotfiles/common/dot-config/nvim -Force
# vscode
New-Item -Path $env:USERPROFILE/AppData/Local/nvim -ItemType SymbolicLink -Value $env:USERPROFILE/dotfiles/common/dot-config/nvim -Force
# vscode
New-Item -Path $env:USERPROFILE/AppData/Roaming/Code/User/settings.json -ItemType SymbolicLink -Value $env:USERPROFILE/dotfiles/configs/Code/User/settings.json -Force
New-Item -Path $env:USERPROFILE/AppData/Roaming/Code/User/keybindings.json -ItemType SymbolicLink -Value $env:USERPROFILE/dotfiles/configs/Code/User/keybindings.json -Force