#!/bin/bash

#Set the PMP environment variable and source some files
export PMP=`ls -la ~ | grep ".bashrc" | awk -F '->' '{print $2}' | tr -d " \t\n\r" | rev | cut -d "/" -f2- | rev`
source "$PMP"/.env
if [[ -d "$PMP/.add-ons" ]]; then
    for file in $(ls "$PMP"/.add-ons); do
        source "$PMP"/.add-ons/$file
    done
fi
for file in $(ls "$PMP"/.functions); do
    source "$PMP"/.functions/"$file"
done
source "$PMP"/.aliases
if [[ `echo -$` =~ i ]]; then
  bind -f "$PMP"/.inputrc
fi
source /etc/bash_completion
source $PMP/.autocompletion/*

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

PS1="$background_black"                             #background color black
PS1+="$text_red\$(error)"                           #text color re and dcalling the error function to check if the last command failed
PS1+="\$(docker_emoji)"                             #emoji if in docker
PS1+="$text_yellow\$(bgjobs)"                       #text color yellow and calling the function to check for backgorund jobs
PS1+=" $text_green\D{%d/%m-%T} "                    #dates in strftime(3): Day/month - hour:minute:second
PS1+='$(color_name)'                                #calling the function to check user color based on the user
PS1+="$text_white@"                                 #color for @ (white)
PS1+="$text_yellow\h$text_black "                   #host
PS1+="$background_blue$(arrow)$text_black "         #ending black arrow	
PS1+='\w'                                           #relative folder path
PS1+="$text_blue$background_blue \$(gitPlugin)"     #adjusting colours and calling git plugin
PS1+="$background_default\n"                        #next line
PS1+="$text_blue$(block)$(arrow)$remove_text_background  ";       #second row with an arrow and a block

PS2="$text_blue$background_default$(block)$(arrow)$remove_text_background  ";

