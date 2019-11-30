#!/bin/bash

#Folder Reference
PMP=`pwd | rev | cut -d "/" -f1- | rev`

if [[ $1=="" ]]; then
    (
    #Asking for permission
    echo -n "Are you sure do you want to install? [Y/n] "
    read
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      echo -n "Great!"
    else
      echo "Installation stopped"
      return 1
    fi

    # Back-upping previous files
    if [[ -f ~/.bashrc || -f ~/.bash_profile || -f .vimrc || -f .inputrc ]]; then
      echo -n "Previous configuration found, do you want to make a backup? [Y/n] "
      read 1
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        mv ~/.bashrc ~/.bashrc.bak && echo ".bashrc backupped!"
        mv ~/.bash_profile ~/.bash_profile.bak && echo ".bash_profile backupped!"
        mv ~/.vimrc ~/.vimrc.bak && echo ".vimrc backupped!"
        mv ~/.inputrc ~/.inputrc.bak && echo ".inputrc backupped!"
      else
        echo "No backup done"
      fi
    fi

    # Making links so that bashrc can be updated
    ln -sv "$PMP/.bashrc" ~/.bashrc
    ln -sv "$PMP/.bash_profile" ~/.bash_profile
    ln -sv "$PMP/.inputrc" ~/.inputrc

    # Vim installation part
    ln -sv "$PMP/.vimrc" .vimrc
    mkdir -p ~/.vim/undodir
    ) 2>/dev/null
elif [[ $1=="-u" ]]; then
    echo "Uninstallation Instructions:"
    echo "  Unlink ~/.bashrc, ~/.bash_profile, ~/.inputrc and ~/.vimrc"
    echo "  Exit from the shell and eventually remove the PMP repo"
elif [[ $1=="-h" ]]; then
    echo "PimpMYPrompt installation script:
-u      Uninstall instructions
-h      Show this help text"
fi
