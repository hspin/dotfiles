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

find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed '/^$/d' | sort > tags
