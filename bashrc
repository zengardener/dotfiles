# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

#eval $(dircolors /home/igor/.dir_colors)

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# .bashrc

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
#HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it - already in globalconf
#shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# Add timestamp to command history
export HISTTIMEFORMAT='%F %T '
export HISTSIZE=60000
export HISTFILESIZE=60000
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.  - already in globalconf
#shopt -s checkwinsize

PS4="[${0##*/}:$LINENO]+ "

# Tweaked prompt.
if [ -f "$HOME/.bash_ps1" ] && [[ $- == *i* ]]; then
    . "$HOME/.bash_ps1"
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# vim:ts=4:sw=4
