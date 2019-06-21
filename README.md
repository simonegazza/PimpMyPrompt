# PimpMyPrompt
This repository contains all the file needed to mimic the agnoster theme for zsh but using plain bash. It also provides some other feature like the username and the date / time of execution of a command.

## Prerequisites:
bash 4.2 or greater

## Optional feature:
custom .vimrc file for Vim8

## Installation:
Just **run** `./install.sh` **in the cloned folder** and you will be ready to go!

## Customization:
You can customize your prompt by putting command and other stuff that you like in the empty directory *pmp.d*. It will be included automatically in your .bashrc file once you reload the prompt!
Also, you can put other environment variables and aliases in *pmp.d/.env*

## Using *s*:
Use it like you will use ssh command. Type `s foo@bar` and you will be connected with the .sshrc provided in the repo (which is a copy of the provided .bashrc), so you will maintain all your aliases!

## Using *j*:
Use it to jump across the system in folder you already visited **still in development**
