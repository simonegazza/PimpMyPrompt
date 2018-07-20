#!bin/bash
function color_name {
	if [ "$USER" = "root" ]; then echo -e "\e[31m\u"
	else echo -e "\e[33m\u"
	fi
}
function arrow { 
	echo -E $'\u25B6'; 
}
function block { 
	echo -E $'\u25AC'; 
}
function error {
	[[ $? -gt 0 ]] && echo " X"
}
function bgjobs {
	[[ `jobs -l | wc -l` -gt 0 ]] && echo -E " ⚙"
}
function gitPlugin{
# Get the status of the repo and chose a color accordingly
    local status=`git status 2>&1`
    if [[ "$status" == *'Not a git repository'* ]]; then
        echo ""
		fi
		for branch in `git status 2>&1 | grep branch | awk '{print $3}'`; do
    	if [[ "$status" == *'working directory clean'* ]]; then
            # green banner with branch name
						echo '\[\e[42m\] $branch \[\e[32m\]\[\e[49m\]$(arrow)'
        else
						echo '\[\e[43m\] $branch'
						echo '\[\e[49m\]\[\e[33m\]$(arrow)'
			fi
		done
}

HISTCONTROL=ignoreboth

#aliases
alias lsa='/bin/ls -la'
alias cl='/bin/clear'
if [ -x /usr/bin/dircolors ]; then #ls with more color
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias cd ...='cd ../../'
alias cd ....='cd ../../../'
alias cd .....='cd ../../../../'

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



PS1='\[\e[48;5;236m\]'							 #basckground color for the first part
PS1+="\[\e[31m\]\$(error)"					 #the error for the last command
PS1+="\[\e[93m\]\$(bgjobs)"					 #looking for background jobs
PS1+=' \[\e[32m\]\D{%d/%m-%H:%M} ' 	 #date in strftime(3)
PS1+="$(color_name)"								 #user color based on the user
PS1+='\[\e[39m@\]'									 #color for @
PS1+='\[\e[33m\h\]\[\e[38;5;236m\] ' #host
PS1+='\[\e[44m\]$(arrow)\[\e[30m\]'	 #backgound and text color for direcotries	
PS1+=' \w'													 #relative folder
PS1+='\[\e[34m\]\[\e[44m\] \[\e[49m\]\[\e[38;5;04m\]$(arrow)'		#last part of the first row (the ending block)
PS1+='\n\[\e[38;5;39m\]\[\e[49m\]$(block)$(arrow)\[\e[0m\]  '; #second row
PS2='\[\e[38;5;39m\]\[\e[49m\]$(block)$(arrow)\[\e[0m\]  ';
