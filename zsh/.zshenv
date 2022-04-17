#!/usr/bin/zsh

export ZDOTDIR="$HOME/.config/zsh"

if command -v nvim &> /dev/null
then
    export EDITOR='nvim'
    export VISUAL='nvim'
elif command -v vim &> /dev/null
then
    export EDITOR='vim'
    export VISUAL='vim'
fi
