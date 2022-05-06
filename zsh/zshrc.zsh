# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Basic ZSH Built-in configuration
autoload -Uz compinit && compinit
setopt autocd
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=50000


eval "$(zoxide init zsh)"
source ~/.config/zsh/p10k.zsh
source ~/.config/zsh/zinit.zsh
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/aliases.zsh

# zsh-autocomplete configuration
zstyle ':autocomplete:*' recent-dirs zoxide
zstyle ':autocomplete:*' min-input 3


# Auto cd after quiting ranger
n() {
    temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
    ranger --choosedir="$temp_file" -- "${@:-$PWD}"
    if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
     cd "$chosen_dir"
    fi
    rm -f -- "$temp_file"
}

# Colorize man output
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[38;5;113m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;167;1m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man $@
}
