#!/bin/bash
SHELL=/bin/bash

function color_name {
	if [ "$USER" = "root" ]; then echo -e "\e[31m\u"
	else printf "\e[33m$USERNAME"
	fi
}
function arrow { 
	echo -E $'\u25B6'; 
}
function block { 
	echo -E $'\u25AC'; 
}
function error {
	[[ $? -gt 0 ]] && echo -E '✖'
}
function bgjobs {
	[[ `jobs -l | wc -l` -gt 0 ]] && echo -E " ⚙"
}
function gitPlugin () {
		# Get the repo's branch for this repo, in this verrsion only a single branch is admitted
		
		gitString=''
		branch=`git status 2>&1 | grep "On branch" | awk '{print $3}'`
    
		if [[ `git status 2>&1` =~ 'not a git repository' ]]; then
      gitString+="\e[49m\e[34m$(arrow)"	

		else if [[ `git status 2>&1` =~ 'Your branch is up to date' ]]; then
			gitString+="\e[42m\e[34m"						
			gitString+="$(arrow) "
			gitString+=$'\u2387'
			gitString+=" \e[42m $branch \e[32m\e[49m$(arrow)"

		else 	
			# yellow banner 
			gitString+="\e[43m\e[38;5;04m$(arrow) \e[30m"
			gitString+=$'\u2387'
			gitString+="  $branch "

			if [[ `git status 2>&1` =~ 'Changes not staged for commit' ]]; then 
				# a plus meaning you have to `git add .`
				gitString+=$'\u271A'
				gitString+=" "
			fi

			if [[ `git status 2>&1` =~ 'Changes to be committed' ]]; then 
				# a big dot meaning you have to 'git commit'
				gitString+=$'\u25CF'
				gitString+=" "
			fi
			if [[ `git status 2>&1` =~ 'Your branch is ahead of' ]]; then
				gitString+=$'\u21D1'		
				gitString+=" "
			fi	
			# ending part of the string
			gitString+="\e[49m\e[33m$(arrow)"
		fi
	fi
echo -ne "$gitString"
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
alias ..='cd ../' 
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
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


PS1=$(tput setab 0)
PS1+=$(tput setaf 1)
PS1+="\$(error)"					 #the error for the last command
PS1+=$(tput setaf 3)
PS1+="\$(bgjobs)"					 #looking for background jobs
PS1+=' \[\e[32m\]\D{%d/%m-%H:%M} ' 	 #date in strftime(3)
PS1+='$(color_name)'								 #user color based on the user
PS1+='\[\e[39m@\]'									 #color for @
PS1+='\[\e[33m\]\h\[\e[30m\] ' #host
PS1+='\[\e[44m\]$(arrow)\[\e[30m\]'	 #backgound and text color for direcotries	
PS1+=' \w'													 #relative folder
PS1+='\[\e[34m\]\[\e[44m\] '				 #last part of the first row (the ending block)
PS1+="\$(gitPlugin)"
PS1+='\[\e[49m\]\n'
PS1+='\[\e[34m\]$(block)$(arrow)\[\e[0m\]  '; #second row
PS2='\[\e[34m\]\[\e[49m\]$(block)$(arrow)\[\e[0m\]  ';

PROMPT_COMMAND="$PS1"
