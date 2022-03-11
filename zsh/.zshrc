export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
	git
	zsh-autosuggestions
	zsh-completions
	zsh-syntax-highlighting
	kubectl
	minikube
	helm
)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/aliases
source $ZSH_CUSTOM/env-vars
source $ZSH_CUSTOM/functions
source $ZSH_CUSTOM/misc