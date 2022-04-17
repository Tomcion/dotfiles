export PATH=$HOME/.scripts:$PATH

# Tab completion
autoload -Uz compinit
compinit

# Enable vim-like navigation
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

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

# Vim mode
bindkey -A viins main
bindkey 'jk' vi-cmd-mode

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

# USER_C=221
# HOST_C=216
# BRACKET=167
# WHITE=15
PATH_C=181

autoload -U colors
colors

PROMPT="%F{red}[%F{yellow}%n%F{red}@%F{magenta}%m %F{$PATH_C}%3~%F{red}]%# %F{$reset_color}"

CHECK=70
CROSS=124

RPROMPT="%(?.%F{$CHECK}.%F{$CROSS})"

# Aliases
alias ls="ls --color"
alias src="exec zsh"

# fzf
export FZF_DEFAULT_COMMAND='fd --no-ignore --hidden --type f'
export FZF_DEFAULT_OPTS='--height=14'
source /usr/share/fzf/key-bindings.zsh
#source /usr/share/fzf/completion.zsh

# Syntax highlighting
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Neofetch
neofetch --colors 3 7 7 3 7 --ascii_colors 3 3
