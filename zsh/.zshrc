export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
	git
	zsh-autosuggestions
	zsh-completions
	zsh-syntax-highlighting
	kubectl
)

source "$ZSH/oh-my-zsh.sh"
source "$HOME/env/aliases"
source "$HOME/env/env-vars"
source "$HOME/env/functions"
source "$HOME/env/misc"
