#!/usr/bin/env bash

# apt install entr
while true; do
  git ls-files "$(git rev-parse --show-toplevel)" | entr -pd kill -USR1 "$TIG_PID"; kill -USR1 "$TIG_PID";
done

#ls site*.txt | entr tmux send-keys -t .0 ":windo e" C-m
