#!/bin/bash
#Folder Reference
PMP=`readlink -f .bashrc | rev | cut -d "/" -f2- | rev`

#Back-upping previous files
if [[ -f ~/.bashrc -o -f ~/.bash_profile -o -f .vimrc -o -f .inputrc]]; then
  read -p "Previous configuration found, do you want to make a backup? [Y/n] " -n 1
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    mv ~/.bashrc ~/.bashrc.bak && echo ".bashrc backupped!"
    mv ~/.bash_profile ~/.bash_profile.bak && echo ".bash_profile backupped!" 
    mv ~/.vimrc ~/.vimrc.bak && echo ".vimrc backupped!"
    mv ~/.inputrc ~/.inputrc.bak && echo ".inputrc backupped!"
  else
    echo "Installation stopped"
    return 1
fi

ln -s "$PMP/.bashrc" ~/.bashrc && echo ".bashrc installed!"
ln -s "$PMP/.bash_profile" ~/.bash_profile && echo ".bash_profile installed!"
ln -s "$PMP/.inputrc" ~/.bashrc && echo ".inputrc installed!"


#vim installation part
ln -s "$PMP/.vimrc" .vimrc
mkdir -p ~/.vim/colors 2>&1
ln -s "$PMP/vim-theme/*" ~/.vim/colors 
