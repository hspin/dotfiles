# ~/.bash_profile: read FIRST, use to call other two:

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# call in profile

. "$HOME/.profile"
