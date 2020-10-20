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

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ "$USER" = "root" ]; then #if the user is root than the username color is red
  user_color="\[\e[31m\]"
else                        #otherwise print just the user name
  user_color="\[\e[33m\]"
fi

PS1="${background_default}"
PS1+="${text_red}\$(error)"
PS1+="${text_gray}\$(bgjobs)"
PS1+="${user_color}$USER${text_white}@${text_blue}\h "
PS1+="${text_green}\w "
PS1+="${text_underlined}${text_dark_gray}\$(gitPlugin)${remove_text_background} > "

PS2="${text_blue}=>${text_white}"
