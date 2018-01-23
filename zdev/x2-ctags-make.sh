#!/usr/bin/env bash

if ! [ -x "$(command -v find)" ]; then
  echo 'Error: find is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v sed)" ]; then
  echo 'Error: sed is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v jsctags)" ]; then
  echo 'Error: jsctags is not installed.' >&2
  exit 1
fi

while true; do
  # ls -e ./src/*.js | entr -d ./x3-ctags-make.sh
  git ls-files "$(git rev-parse --show-toplevel)" | entr -d ./x3-ctags-make.sh
done
