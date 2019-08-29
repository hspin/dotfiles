#!/usr/bin/env bash
# make full version of vimrc

sed '/"startabc/,/"endabc/c 444444444444' vimrc | \
sed '/"startxyz/,/"endxyz/c 888888888888' | \
sed "s/444444444444/cat vim-dev/e" | \
sed "s/888888888888/cat vim-dev-vimrc/e" | less
