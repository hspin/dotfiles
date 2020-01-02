# ~/.profile: executed by Bourne-compatible login shells.

# CAPS=/home/ubuntu/lscripts/.01-super-caps.sh
# if [ -f "${CAPS}" ]; then
#   /bin/bash "${CAPS}"
# fi

CAPS=/home/ubuntu/lscripts/.02-super-caps.sh
if [ -f "${CAPS}" ]; then
  /bin/bash "${CAPS}"
fi

# ----------------------------------------------------------------------
# PATH
# ----------------------------------------------------------------------

if [ -d "$HOME/.bin" ] ; then
  PATH="$PATH:$HOME/.bin"
fi

if [ -d "$HOME/.lbin-local" ] ; then
  PATH="$PATH:$HOME/.lbin-local"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$PATH:$HOME/.local/bin"
fi

export PATH

# ----------------------------------------------------------------------
# other
# ----------------------------------------------------------------------
# if running bash
if [ -n "$BASH_VERSION" ]; then

    if [ -n "$LC_tmux_session" ]; then
        exec mux "$LC_tmux_session"
    fi

fi

# test display
xhost +si:localuser:$( whoami ) >&/dev/null && {
    echo "YES GUI"

    # start windows manager
    # if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
      # exec startx
    # fi

    # super caps lock key; apt install xscape
    # if [ -x /usr/bin/setxkbmap ] && [ -z "$DISPLAY" ]; then
    #     setxkbmap -option 'caps:ctrl_modifier'
    # fi

    # if [ -x /usr/bin/xcape ] && [ -z "$DISPLAY" ]; then
    #     xcape -e 'Caps_Lock=Escape'
    # fi
} || {
   # echo "No, only console"
   echo "console only"
}

