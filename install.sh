#!/bin/bash

#Folder Reference
PMP=`pwd | rev | cut -d "/" -f1- | rev`

if [[ $1=="" ]]; then
    (
    # Back-upping previous files
    if [[ -f ~/.bashrc || -f ~/.bash_profile]]; then
      echo -n "Previous configuration found, do you want to make a backup? [Y/n] "
      read 1
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        mv ~/.bashrc ~/.bashrc.bak && echo ".bashrc backupped!"
        mv ~/.bash_profile ~/.bash_profile.bak && echo ".bash_profile backupped!"
      else
        echo "No backup done"
      fi
    fi

    # Making links so that bashrc can be updated
    ln -sv "$PMP/.bashrc" ~/.bashrc
    ln -sv "$PMP/.bash_profile" ~/.bash_profile
    ) 2>/dev/null
elif [[ $1=="-u" ]]; then
    echo "Uninstallation Instructions:"
    echo "  1) unlink ~/.bashrc and ~/.bash_profile"
    echo "  2) exit from the shell and remove the PimpMyPrompt repo"
elif [[ $1=="-h" ]]; then
    echo "PimpMyPrompt installation script:
-u      Uninstall instructions
-h      Show this help text"
fi
