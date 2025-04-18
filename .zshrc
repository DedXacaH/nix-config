# Terminal Art
fastfetch

# Keybindings
bindkey -v 
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
HISTDUPE=erase

# Envs
export EDITOR=nvim
export VISUAL=nvim
export DEFAULT_PLAYER=mpv
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_DESKTOP=Hyprland
export XKB_DEFAULT_LAYOUT=us,ru
export XKB_DEFAULT_OPTIONS=grp:caps_toggle,grp_led:caps

# Aliases
alias f="lf"
alias ls="lsd -lA"
alias v="nvim"
alias zshconf="$EDITOR ~/.zshrc && source ~/.zshrc"

# Colorscheme -- Pywal16 --
(cat ~/.cache/wal/sequences &)
cat ~/.cache/wal/sequences
source ~/.cache/wal/colors-tty.sh 

# Shell Integrations
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"


# Plugins
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

