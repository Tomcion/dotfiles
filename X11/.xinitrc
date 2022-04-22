#!/bin/sh

userresources=$XDG_CONFIG_HOME/X11/.Xresources
usermodmap=$XDG_CONFIG_HOME/X11/.Xmodmap

# Xresources
[[ -f $userresources ]] && xrdb -merge $userresources

# keymaps
[[ -f $usermodmap ]] && xmodmap $usermodmap

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

killall -q polybar
polybar &

feh --bg-fill ~/.local/share/wallpapers/desert.jpg

dunst &

picom --experimental-backends &

exec i3
