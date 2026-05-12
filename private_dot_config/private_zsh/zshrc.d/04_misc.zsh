setopt nonomatch
setopt autocd

autoload -Uz compinit
compinit -u

ulimit -n 4096

# eval "$(mise activate zsh)"
eval `ssh-agent -s` > /dev/null

. "$HOME/.atuin/bin/env"
