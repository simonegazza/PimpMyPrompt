#!/bin/bash

PMP=`ls -la ~ | grep ".bashrc" | awk -F '->' '{print $2}' | tr -d " \t\n\r" | rev | cut -d "/" -f2- | rev`

[[ -d "$PMP/add-ons" ]] && source "$PMP"/.add-ons/*
source "$PMP"/.functions
source "$PMP"/.aliases
source "$PMP"/.env
if [[ `echo -$` =~ i ]]; then
  bind -f "$PMP"/.inputrc
fi

HISTCONTROL=ignorespace
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# append to the history file, don't overwrite it
shopt -s histappend

# make "less" more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1='\[\e[40m\]'                              #background color black
PS1+='\[\e[31m\]'                             #text color red
PS1+="\$(error)"                              #calling the error function to check if the last command failed
PS1+="\$(docker_emoji)"
PS1+='\[\e[33m\]'                             #text color green
PS1+="\$(bgjobs)"                             #calling the function to check for backgorund jobs
PS1+=' \[\e[32m\]\D{%d/%m-%T} '               #dates in strftime(3): Day/month - hour:minute:second
PS1+='$(color_name)'                          #calling the function to check user color based on the user
PS1+='\[\e[39m@\]'                            #color for @ (white)
PS1+='\[\e[33m\]\h\[\e[30m\] '                #host
PS1+='\[\e[44m\]$(arrow)\[\e[30m\] '          #ending black arrow	
PS1+='\w'                                     #relative folder path
PS1+='\[\e[34m\]\[\e[44m\] '                  #adjusting colours for git plugin
PS1+="\$(gitPlugin)"                          #calling the function for the git plugin
PS1+='\[\e[49m\]\n'                           #next line
PS1+='\[\e[34m\]$(block)$(arrow)\[\e[0m\]  '; #second row with an arrow and a block

PS2='\[\e[34m\]\[\e[49m\]$(block)$(arrow)\[\e[0m\]  ';

