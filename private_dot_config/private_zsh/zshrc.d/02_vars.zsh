export ZSH_CUSTOM="$ZDOTDIR/zshrc.d"
export ZFUNCIDR="$ZDOTDIR/functions"

export EDITOR=fresh
export GPG_TTY=$(tty)
export DIRENV_LOG_FORMAT=""
export JETBRAINS_PROJECT=$([ -d ".idea" ] && echo "$PWD")
export BIN_DIR="$HOME/.local/bin"
export EGET_BIN="$BIN_DIR"
export PYTHONWARNINGS=ignore
export BAT_PAGING=never
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/.pythonrc.py"
