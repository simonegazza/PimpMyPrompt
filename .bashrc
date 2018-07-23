#!/bin/bash
SHELL=/bin/bash
EDITOR=vim
COLUMNS=200

function color_name {
  if [ "$USER" = "root" ]; then echo -e "\e[31m\u"  #if the user is root than the username color is red
  else printf "\e[33m$USERNAME"  #otherwise print just the user name
  fi
}
function arrow { 
  echo -E $'\u25B6';  #unicode for arrow
}
function block { 
  echo -E $'\u25AC';  #unicode for the block
}
function error {
  [[ $? -gt 0 ]] && echo -E '✖'  #check is the last command was a failure
}
function bgjobs {
  [[ `jobs -l | wc -l` -gt 0 ]] && echo -E " ⚙"  #check if the current user has backgorund jobs
}
function gitPlugin () {  #git Plugin
  # Get the repo's branch for this repo, in this verrsion only a single branch is admitted
  gitString=''  #value return string
  branch=`git status 2>&1 | grep "On branch" | awk '{print $3}'`  #first current branch
    
  if [[ `git status 2>&1` =~ 'not a git repository' ]]; then  #check if it is a repository and if not so, just print the arrow to end the line
    gitString+="\e[49m\e[34m$(arrow)"	
  else if [[ `git status 2>&1` =~ 'Your branch is up to date' ]] && [[ `git status | wc -l` -eq "4" ]]; then 					#check if the branch is up to date with no mods, if so print a green banner with the branch symbol and the branch name
    gitString+="\e[42m\e[34m"						
		gitString+="$(arrow) "
		gitString+="\e[30m"
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
alias sudo='sudo '
alias lsa='ls -la'
alias c='clear'
alias cl='clear;pwd;ls -la'
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
function gitPushAll() {
	if [ "$#" -eq "0" ]; then
		message="Mods applied to the Repo"
	else
		message="$1"
	fi

	git add --all
	git commit -m "$message"
	git push
}
alias ggg=gitPushAll
alias cleardns="sudo /etc/init.d/dns-clean restart && echo DNS cache cleared"
function makeBackUpFile() {
	cp $1 $1.bak
	echo "made $1 backup file"
}
alias mbf=makeBackUpFile
alias filehost='vim /etc/hosts'
alias asites='cd /etc/apache2/sites-enabled'
alias nsites='cd /etc/nginx/sites-enabled'
alias restart='sudo systemctl restart '
alias start='sudo systemctl start '
alias reload='sudo systemctl reload '
alias stop='sudo systemctl stop '

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

PS1='\[\e[40m\]'															#background color black
PS1+='\[\e[31m\]'															#text color red
PS1+="\$(error)"															#calling the error function to check if the last command failed
PS1+='\[\e[32m\]'															#text color green
PS1+="\$(bgjobs)"															#calling the function to check for backgorund jobs
PS1+=' \[\e[32m\]\D{%d/%m-%T} '								#dates in strftime(3): Day/month - hour:minute:second
PS1+='$(color_name)'													#calling the function to check user color based on the user
PS1+='\[\e[39m@\]'														#color for @ (white)
PS1+='\[\e[33m\]\h\[\e[30m\] '								#host
PS1+='\[\e[44m\]$(arrow)\[\e[30m\]'						#ending black arrow	
PS1+=' \w'																		#relative folder path
PS1+='\[\e[34m\]\[\e[44m\] '									#adjusting colours for git plugin
PS1+="\$(gitPlugin)"													#calling the function for the git plugin
PS1+='\[\e[49m\]\n'														#next line
PS1+='\[\e[34m\]$(block)$(arrow)\[\e[0m\]  '; #second row with an arrow and a block

PS2='\[\e[34m\]\[\e[49m\]$(block)$(arrow)\[\e[0m\]  ';
