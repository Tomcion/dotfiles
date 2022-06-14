#!/usr/bin/zsh

export EDITOR='nvim'
export VISUAL='nvim'

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export XINITRC="$XDG_CONFIG_HOME/X11/.xinitrc"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

export RANGER_LOAD_DEFAULT_RC="false"

export QT_QPA_PLATFORMTHEME=qt5ct
