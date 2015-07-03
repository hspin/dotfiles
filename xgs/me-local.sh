#!/bin/bash


source ${HOME}/.xgs/second-local.sh

# **********************
# These are per machine
# **********************

#source /usr/share/autojump/autojump.bash


# **********************
# tmux and agent
# **********************
if [ -z "$TMUX" ]; then
#not in tmux
	# If we have keychain, start it 
	if [ -f /usr/bin/keychain ]; then
	    /usr/bin/keychain ~/.ssh/id_rsa
	    /usr/bin/keychain ~/.ssh/id_rsa_bit
	    source ~/.keychain/$HOSTNAME-sh > /dev/null
	fi

#  ************* GPG_AGENT_INFO ******************
  if [ -f "${HOME}/.gnupg/gpg-agent-info-${HOSTNAME}" ]; then
    . "${HOME}/.gnupg/gpg-agent-info-${HOSTNAME}"
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
  fi

fi

#  ************* GPG_AGENT_INFO ******************
# add these to /.gnupg/gpg-agent.conf                                                            
# # set for 8 hours
#default-cache-ttl 30000
#max-cache-ttl 30002
#pinentry-program /usr/bin/pinentry-curses

