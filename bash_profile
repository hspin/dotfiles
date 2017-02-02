# if running bash
if [ -n "$BASH_VERSION" ]; then

    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi

    if [ -n "$LC_tmux_session" ]; then
        exec mux "$LC_tmux_session"
    fi

    if [ -n "$LC_runcmd" ]; then
        exec "$LC_runcmd"
    fi
fi

# start windows manager
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi


# export variables
export LC_MESSAGES="C"

# super caps lock key; apt install xscape
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'


#if [ -n "$TMUX" ]; then
# yes tmux
#  . "$HOME/.bashrc"
#fi

# vim: set ft=sh:
