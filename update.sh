#!/bin/bash
set -e

read -p "Do you want to check for update? [Y/n] " -n 1;
if [[ $REPLY =~ ^[Yy]$ ]]; then 
  git remote -v update && echo "Update Success"
elif [[ $REPLY =~ ^[Nn]$ ]]; then
  echo "Update skipped"
else 
  echo "Unknown option. Terminating"
fi

source "$PMP"/.bashrc
