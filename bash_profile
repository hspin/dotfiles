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

# test display
xhost +si:localuser:$( whoami ) >&/dev/null && {
    # echo "YES GUI"

    # start windows manager
    if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
      exec startx
    fi

    # super caps lock key; apt install xscape
    if [ -x /usr/bin/setxkbmap ] && [ -z "$DISPLAY" ]; then
        setxkbmap -option 'caps:ctrl_modifier'
    fi

    if [ -x /usr/bin/xcape ] && [ -z "$DISPLAY" ]; then
        xcape -e 'Caps_Lock=Escape'
    fi
} || {
   # echo "No, only console"
   echo "console only"
}


# export variables
export LC_MESSAGES="C"


#if [ -n "$TMUX" ]; then
# yes tmux
#  . "$HOME/.bashrc"
#fi

# vim: set ft=sh:
