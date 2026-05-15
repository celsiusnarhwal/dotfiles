export ZSH_CUSTOM="$ZDOTDIR/zshrc.d"
export ZFUNCIDR="$ZDOTDIR/functions"

export EDITOR=micro
export GPG_TTY=$(tty)
export DIRENV_LOG_FORMAT=""
export JETBRAINS_PROJECT=$([ -d ".idea" ] && echo "$PWD")
export BIN_DIR="$HOME/.local/bin"
export EGET_BIN="$BIN_DIR"
export PYTHONWARNINGS=ignore
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/.pythonrc.py"
export MICRO_TRUECOLOR=1
export LESS="-R"
export FORCE_COLOR=1
export CLICOLOR_FORCE=1
