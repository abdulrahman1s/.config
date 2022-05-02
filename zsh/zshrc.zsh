# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=50000

autoload -Uz compinit && compinit

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[38;5;113m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;167;1m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

PATH=$PATH:~/.local/bin/
eval "$(zoxide init zsh)"

source "$HOME/.config/zsh/p10k.zsh"
source "$HOME/.config/zsh/zinit.zsh"
source "$HOME/.config/zsh/plugins.zsh"
source "$HOME/.config/zsh/aliases.zsh"

# zsh-autocomplete configuration
zstyle ':autocomplete:*' recent-dirs zoxide
zstyle ':autocomplete:*' min-input 3
