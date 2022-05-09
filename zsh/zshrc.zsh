# Basic ZSH Built-in configuration
autoload -Uz compinit && compinit
setopt autocd
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=50000


eval "$(zoxide init zsh)"
eval "$(thefuck --alias)"
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

export PNPM_HOME="/home/abdulrahman/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
