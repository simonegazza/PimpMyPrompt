#!/bin/bash

set -e

upstream=$1
loc=$(git rev-parse @)
base=$(git merge-base @ "$UPSTREAM")

if [ $loc = $base ]; then
    echo "Updates available, do you wish to update? [Y/n]"
    read -n 1
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Updating..."
        git -C $PMP pull https://github.com/simonegazza/PimpMyPrompt.git > /dev/null 2>&1
        echo "Update completed"
    fi
fi
