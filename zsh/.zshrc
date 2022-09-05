export PATH=$HOME/.scripts:$PATH

# Tab completion
autoload -Uz compinit
compinit

# Enable vim-like navigation
# zstyle ':completion:*' menu select
# zmodload zsh/complist
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward

# Directory stack
DIRSTACKSIZE=8
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

show_stack() {
    sel_dir=$(dirs -v | awk -F'\t' '{print $2}' | dmenu)
    sel_dir="${sel_dir/#\~/$HOME}"
    len=${#sel_dir}
    BUFFER="${BUFFER:0:$CURSOR}${sel_dir}${BUFFER:$CURSOR}"
    CURSOR+=$len
}

if command -v dmenu &> /dev/null; then
    zle -N show_stack
    bindkey '^j' show_stack
fi

# Vim mode
bindkey -A viins main
bindkey 'jk' vi-cmd-mode
bindkey -s '^o' 'ranger\n'

bindkey '^?' backward-delete-char # Fixing the mode-switching delete problem

autoload -U select-bracketed
autoload -U select-quoted
zle -N select-bracketed
zle -N select-quoted
for m in visual viopp; do
	for c in {a,i}{\',\",\`}; do
	  bindkey -M $m $c select-quoted
	done
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $m $c select-bracketed
    done
done

# Nice prompt

PATH_C=181

autoload -U colors
colors

PROMPT="%F{blue}[%F{reset_color}%n%F{magenta}@%F{reset_color}%m %F{magenta}%1~%F{blue}]%# %F{$reset_color}"

CHECK=70
CROSS=124

RPROMPT="%(?..%F{$CROSS})"

# Aliases
source "$ZDOTDIR/aliases"

# fzf
export FZF_DEFAULT_COMMAND='fd --no-ignore --hidden --type f'
export FZF_DEFAULT_OPTS='--height=14'
source /usr/share/fzf/key-bindings.zsh
#source /usr/share/fzf/completion.zsh

# Syntax highlighting
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Neofetch
neofetch 
