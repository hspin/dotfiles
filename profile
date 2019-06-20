# ~/.profile: executed by Bourne-compatible login shells.
#
if xhost >& /dev/null ; then 
    echo "Display exists"
    CAPS=/home/ubuntu/lscripts/01-super-caps.sh
    if [ -f "{$CAPS}" ]; then
        /bin/bash "{$CAPS}"
    fi
fi

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
