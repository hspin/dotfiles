# ~/.profile: executed by Bourne-compatible login shells.

# do not edit this file. put files in the dir below.
source ~/.bashrc
for FN in $HOME/.dotfiles/profile.d/*.sh ; do
    source "$FN"
done
