#!/bin/bash

#Set the PMP environment variable and source some files
export PMP=`ls -la ~ | grep ".bashrc" | awk -F '->' '{print $2}' | tr -d " \t\n\r" | rev | cut -d "/" -f2- | rev`
source "$PMP"/.env
if [[ -d "$PMP/pmp.d" ]]; then
    for file in $(ls "$PMP"/pmp.d); do
        source "$PMP"/pmp.d/$file
    done
fi
for file in $(ls "$PMP"/.functions); do
    source "$PMP"/.functions/"$file"
done
source "$PMP"/.aliases
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

PS1="${background_default}"
PS1+="${text_red}\$(error)"
PS1+="${text_yellow}\$(bgjobs)"
PS1+="\u${text_white}@${text_blue}\h "
PS1+="${text_green}\w "
PS1+="${text_underlined}${text_dim}${text_gray}\$(gitPlugin)${remove_text_background} "
PS1+="> "

PS2="${text_blue}~>${text_white}"
