setopt nonomatch
setopt autocd

autoload -Uz compinit
compinit -u

ulimit -n 4096

eval "$(mise activate zsh)"
eval "$(thefuck --alias)"
eval "$(batman --export-env)"
