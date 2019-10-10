# ~/.profile: executed by Bourne-compatible login shells.

# CAPS=/home/ubuntu/lscripts/.01-super-caps.sh
# if [ -f "${CAPS}" ]; then
#   /bin/bash "${CAPS}"
# fi

CAPS=/home/ubuntu/lscripts/.02-super-caps.sh
if [ -f "${CAPS}" ]; then
  /bin/bash "${CAPS}"
fi

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
