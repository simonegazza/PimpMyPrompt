#!/bin/bash

#Folder Reference
PMP=`readlink -f .bashrc | rev | cut -d "/" -f2- | rev`

(
#Asking for permission
echo -n "Are you sure do you want to install? [Y/n] "
read -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo -n ""
else 
  echo "Installation stopped"
  return 1
fi

#Back-upping previous files
if [[ -f ~/.bashrc || -f ~/.bash_profile || -f .vimrc || -f .inputrc ]]; then
  echo -n "Previous configuration found, do you want to make a backup? [Y/n] "
  read -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    mv ~/.bashrc ~/.bashrc.bak && echo ".bashrc backupped!"
    mv ~/.bash_profile ~/.bash_profile.bak && echo ".bash_profile backupped!" 
    mv ~/.vimrc ~/.vimrc.bak && echo ".vimrc backupped!"
    mv ~/.inputrc ~/.inputrc.bak && echo ".inputrc backupped!"
  else
    echo "Installation stopped"
    return 1
  fi
fi

#making links so that bashrc can be updated 
ln -s "$PMP/.bashrc" ~/.bashrc && echo ".bashrc installed!"
ln -s "$PMP/.bash_profile" ~/.bash_profile && echo ".bash_profile installed!"
ln -s "$PMP/.inputrc" ~/.bashrc && echo ".inputrc installed!"

#vim installation part
ln -s "$PMP/.vimrc" .vimrc
mkdir -p ~/.vim/colors 2>&1
ln -s "$PMP/vim-theme/*" ~/.vim/colors 
) 2>/dev/null
