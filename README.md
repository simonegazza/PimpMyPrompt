# PimpMyPrompt
This project was born because zsh is not a standard and not in all linux systems.
Also it is too big to use across ssh to another server.
Bash is in all linux systems, thus uploading the configuration files is enough to have the current terminal remotely.
You can also see this as my dofiles folder.

## Prerequisites:
bash 4.2 or greater

## Optional feature:
custom .vimrc file, skeletons and a theme for Vim8

## Installation:
Just **run** `./install.sh` **in the cloned folder** and you will be ready to go!

## Customization:
You can customize your prompt by putting stuff that you like in the empty directory `pmp.d`.
It will be included automatically in your configuration once you reload the prompt!
Also, you can put other environment variables and aliases in `pmp.d/env`

## Using *s*:
Use it like you will use ssh command.
Type `s foo@bar` and take all your aliases with you!

## Using *j*:
Use it to jump across the system in folders you want to visit frequently.
For more information run `j -h`
