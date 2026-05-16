ZSHRCD=$ZSH_CUSTOM/local/$(cm data | jq -r .chezmoi.hostname) 
[[ -d "$ZSHRCD" ]] && ZSHRCD=$ZSHRCD source $(antidote path mattmc3/zshrc.d)/zshrc.d.plugin.zsh
