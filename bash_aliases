# A sane bash environment.

# ----------------------------------------------------------------------
# PROMPT
# ----------------------------------------------------------------------

case "$TERM" in
xterm*|rxvt*)
    PS1='\[\e]0;\w\a\]\[\e[32m\]\u@\h: \[\e[36;1m\]\w\[\e[0m\]\n\$ '
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# Prompt for tmux
case "$TERM" in
screen-256color)
#My promt - Need both lines
    PS1='\[\e]0;\w\a\]\[\e[33m\]\u@\h: \[\e[36;1m\]\w\[\e[0m\]\n\$ '
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# ----------------------------------------------------------------------
# PAGER / EDITOR
# ----------------------------------------------------------------------

export EDITOR=vim
export PAGER="less -X -R -F"
# ignore case, long prompt, exit if it fits on one screen, allow colors for ls and grep colors
export LESS="-iMFXR"

# ----------------------------------------------------------------------
# ENVIRONMENT CONFIGURATION
# ----------------------------------------------------------------------

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

if [[ -z $TMUX ]]; then
        #export TERM='xterm'
        export TERM='xterm-256color'
else
        #export TERM='screen'
        export TERM='screen-256color'
fi

# ----------------------------------------------------------------------
# LS AND DIRCOLORS
# ----------------------------------------------------------------------

# if the dircolors utility is available, set that up to
dircolors="$(type -P gdircolors dircolors | head -1)"
if [ -n "$dircolors" ]; then
    COLORS=/etc/DIR_COLORS
    test -e "/etc/DIR_COLORS.$TERM"   && COLORS="/etc/DIR_COLORS.$TERM"
    test -e "$HOME/.dircolors"        && COLORS="$HOME/.dircolors"
    test ! -e "$COLORS"               && COLORS=
    eval `$dircolors --sh $COLORS`
fi

unset dircolors

# ----------------------------------------------------------------------
# PATH
# ----------------------------------------------------------------------

if [ -e "$HOME/.bin" ] ; then
    PATH=$HOME/.bin:$PATH
fi

if [ -e "$HOME/.lbin-local" ] ; then
    PATH=$HOME/.lbin-local:$PATH
fi

#export PATH=~/.dotfiles/bin:${PATH}

export PATH

# -------------------------------------------------------------------
# USER SHELL ALIAS
# -------------------------------------------------------------------

# my alias#{{{
alias ls='ls -h --color=auto'
# some more ls aliases
alias ll='ls -la --group-directories-first'
alias las='ls -la'
alias l='ls -lah --group-directories-first'
alias lm='ls -la --group-directories-first | more'
alias lss='ls -lv'
alias la='ls -A'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias dot="ls -ldF .[a-zA-Z0-9]* --color=auto"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias u="cd .."
alias cls="clear"
alias tarx="tar xvzf"
alias tarc="tar cvzf"

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias nsl='netstat -alnp --protocol=inet | grep -v CLOSE_WAIT | cut -c-6,21-94 '
alias dusk='du -s -k -c * | sort -rn'
alias du='du -h'
alias df="df -h"

alias mecp="rsync -av --progress"
#alias xclip="tr -d '\n' | xclip -selection primary"
#alias xclip="xclip -selection c"
alias xclip="echo 'ERROR=use cb instead!'"

alias pss='ps faxu | grep -v grep | grep '
alias psg='ps aux | grep -v grep | grep $1'
alias pkill='killps'

alias gdd="git diff --no-ext-diff -w "$@" | vim -R -"

alias xx="exit"
alias mixer="alsamixer"
alias pmixer="pavucontrol"

alias pwgenx="/usr/bin/pwgen -sBcn 12 8"
alias pwgenxx="/usr/bin/pwgen -sBcn 16 8"
alias pwgen="pwgen 10"

alias simpleserver="python -m SimpleHTTPServer 7070"
alias ttc='tty-clock -c -t -C 3'
alias k="less"
alias lok="i3lock"

#tmuxinator shortcuts
alias tml="tmux list-sessions"
alias tmll="ls ~/.tmuxinator/"
alias tma="tmux -2 attach -t $1"
alias tmk="tmux kill-session -t $1"

#}}}

# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------

# usefull
# pp - for process
# ii - for system info

function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

function cd() {
   builtin cd "$@"
   ls --color=auto
}

function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }
function pp() { my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }

function ask()          # See 'killps' for example of use.
{
    echo -n "$@" '[y/n] ' ; read ans
    case "$ans" in
        y*|Y*) return 0 ;;
        *) return 1 ;;
    esac
}

function killps()   # kill by process name
{
    local pid pname sig="-TERM"   # default signal
    if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
        echo "Usage: killps [-SIGNAL] pattern"
        return;
    fi
    if [ $# = 2 ]; then sig=$1 ; fi
    for pid in $(my_ps| awk '!/awk/ && $0~pat { print $1 }' pat=${!#} )
    do
        pname=$(my_ps | awk '$1~var { print $5 }' var=$pid )
        if ask "Kill process $pid <$pname> with signal $sig?"
            then kill $sig $pid
        fi
    done
}

function mydf()         # Pretty-print of 'df' output.
{                       # Inspired by 'dfc' utility.
    for fs ; do

        if [ ! -d $fs ]
        then
          echo -e $fs" :No such file or directory" ; continue
        fi

        local info=( $(command df -P $fs | awk 'END{ print $2,$3,$5 }') )
        local free=( $(command df -Pkh $fs | awk 'END{ print $4 }') )
        local nbstars=$(( 20 * ${info[1]} / ${info[0]} ))
        local out="["
        for ((j=0;j<20;j++)); do
            if [ ${j} -lt ${nbstars} ]; then
               out=$out"*"
            else
               out=$out"-"
            fi
        done
        out=${info[2]}" "$out"] ("$free" free on "$fs")"
        echo -e $out
    done
}


function my_ip() # Get IP adress on ethernet.
{
    MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}
}

function ii()   # Get current host related info.
{
    echo -e "\nYou are logged on ${BRed}$HOST"
    echo -e "\n${BRed}Additionnal information:$NC " ; uname -a
    echo -e "\n${BRed}Users logged on:$NC " ; w -hs |
             cut -d " " -f1 | sort | uniq
    echo -e "\n${BRed}Current date :$NC " ; date
    echo -e "\n${BRed}Machine stats :$NC " ; uptime
    #echo -e "\n${BRed}Memory stats :$NC " ; free
    echo -e "\n${BRed}Diskspace :$NC " ; mydf / $HOME
    echo -e "\n${BRed}Local IP Address :$NC" ; my_ip
    #echo -e "\n${BRed}Open connections :$NC "; netstat -pan --inet;
    echo
}

# A shortcut function that simplifies usage of xclip.
# - Accepts input from either stdin (pipe), or params.
# ------------------------------------------------
cb() {
  local _scs_col="\e[0;32m"; local _wrn_col='\e[1;31m'; local _trn_col='\e[0;33m'
  # Check that xclip is installed.
  if ! type xclip > /dev/null 2>&1; then
    echo -e "$_wrn_col""You must have the 'xclip' program installed.\e[0m"
  # Check user is not root (root doesn't have access to user xorg server)
  elif [[ "$USER" == "root" ]]; then
    echo -e "$_wrn_col""Must be regular user (not root) to copy a file to the clipboard.\e[0m"
  else
    # If no tty, data should be available on stdin
    if ! [[ "$( tty )" == /dev/* ]]; then
      input="$(< /dev/stdin)"
    # Else, fetch input from params
    else
      input="$*"
    fi
    if [ -z "$input" ]; then  # If no input, print usage message.
      echo "Copies a string to the clipboard."
      echo "Usage: cb <string>"
      echo "       echo <string> | cb"
    else
      # Copy input to clipboard
      echo -n "$input" | /usr/bin/xclip -selection c
      echo -n "$input" | /usr/bin/xclip -selection primary
      # Truncate text for status
      if [ ${#input} -gt 80 ]; then input="$(echo $input | cut -c1-80)$_trn_col...\e[0m"; fi
      # Print status.
      echo -e "$_scs_col""Copied to clipboard:\e[0m $input"
    fi
  fi
}
# Aliases / functions leveraging the cb() function
# ------------------------------------------------
# Copy contents of a file
function cbf() { cat "$1" | cb; }  

# Copy current working directory
alias cbwd="pwd | cb"  

# the go command
go() {
   if [ -f "$1" ]; then
     if [ -n "`file $1 | grep '\(text\|empty\|no magic\)'`" ]; then
       if [ -w "$1" ]; then
         $EDITOR "$1"
       else
          sudo $EDITOR "$1"
          #$EDITOR /sudo::"$1" # For emacsclient+tramp
       fi
     else
       if [ -e "`which xdg-open`" ]; then
         if [ -n "$DISPLAY" ]; then
           xdg-open "$1" > /dev/null
         else
           echo "DISPLAY not set:  xdg-open requires X11"
         fi
       else
         echo "xdg-open not found:  unable to open '$1'"
       fi
     fi
   elif [ -d "$1" ]; then
     cd "$1"
   elif [ "" = "$1" ]; then
     cd
   elif [ -n "`declare -f | grep '^j ()'`" ]; then
     j "$1"
   else
     echo "Ran out of things to do with '$1'"
   fi
 }

alias o=go

# get a project scaffold quick
function qstart() {
    REALDIR="template-ready"
    git clone --quiet --depth 1 git@github.com:hspin/tpl_webapp.git $REALDIR
    cd $REALDIR
    rm -rf .git
    rm -f .gitignore
    cd ..
    echo "done -"
}

# ----------------------------------------------------------------------
#  SHELL OPTIONS
# ----------------------------------------------------------------------

if [ -f "$HOME/.bcrc" ] ; then
    export BC_ENV_ARGS=~/.bcrc
fi

if [ -f ~/.bash-local ]; then
    source ~/.bash-local
fi

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

[[ -s /usr/share/autojump/autojump.bash ]] && source /usr/share/autojump/autojump.bash
