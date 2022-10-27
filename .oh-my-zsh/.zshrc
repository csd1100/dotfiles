export ZSH="/home/cdeshpande/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
	git
	zsh-autosuggestions
	zsh-completions
	zsh-syntax-highlighting
	)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/aliases
source $ZSH_CUSTOM/env_vars
source $ZSH_CUSTOM/functions

