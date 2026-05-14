setopt nonomatch
setopt autocd

autoload -Uz compinit
compinit -u

ulimit -n 4096

eval "$(thefuck --alias)"
eval "$(batman --export-env)"
