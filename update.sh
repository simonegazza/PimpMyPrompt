#!/bin/bash
if [[ `git status 2>&1` =~ 'Your branch is behind' ]]; then 
  if [[ "$1" == "--force" || "$1" == "-f" ]]; then
    git pull origin master
  else 
    read -p "Do you want to check for update? [Y/n] " -n 1;
    echo -n ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      git pull origin master
    fi
  fi
fi
