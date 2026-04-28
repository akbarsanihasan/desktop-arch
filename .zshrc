#---------- Options ----------#
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

autoload -Uz compinit
compinit


#---------- Plugins ----------#
export ZSH="$HOME/.local/share/oh-my-zsh"
plugins=(
    zsh-autosuggestions 
    zsh-syntax-highlighting 
    zsh-completions 
    vi-mode 
    git 
    archlinux
)
ZSH_THEME=robbyrussell
source $ZSH/oh-my-zsh.sh


#---------- Export vars ----------#
export FZF_DEFAULT_OPTS="--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
    --prompt '󰭎 ' --pointer ' ' --layout=reverse --border top \
    --multi"


#---------- Aliases ----------#
if command -v trash-put &>/dev/null; then
    alias rm='echo "You probably want to use trash-put"; false'
fi


#---------- Keybinds ----------#
tsessionaizer() {
    zle -I
    BUFFER="$HOME/.local/bin/tmux_sessionaizer"
    zle accept-line
}
zle -N tsessionaizer

tsessionaizer_global() {
    zle -I
    BUFFER="$HOME/.local/bin/tmux_sessionaizer global"
    zle accept-line
}
zle -N tsessionaizer_global

tsessionaizer_main() {
    zle -I
    BUFFER="$HOME/.local/bin/tmux_sessionaizer main"
    zle accept-line
}
zle -N tsessionaizer_main

if [[ -z $TMUX ]]; then
    bindkey "^B." tsessionaizer
    bindkey "^B;" tsessionaizer_global
    bindkey "^B'" tsessionaizer_main
fi


#---------- Path ----------#
export PATH="$HOME/.local/bin:$PATH"

# NodeJS
export NPM_CONFIG_CACHE=$HOME/.node
export NPM_CONFIG_PREFIX=$HOME/.node
if command -v fnm &>/dev/null || command -v /usr/local/bin/fnm &>/dev/null; then
   eval "$(fnm env --fnm-dir "$HOME"/.node)"
fi

# Golang
export PATH="/opt/go/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# PHP
export PATH="/opt/php/bin:$PATH"
export PHP_INI_SCAN_DIR="/opt/php:$PHP_INI_SCAN_DIR"

# Rust
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Fly.io
export FLYCTL_INSTALL="/home/akbarsanihasan/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
