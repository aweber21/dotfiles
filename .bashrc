#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias ll='ls -alv --color=auto'
alias grep='grep --color=auto'

# Environment Variables
PS1='[\u@\h \W]\$ '
