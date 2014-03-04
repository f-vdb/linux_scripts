#!/bin/bash
# add these lines to the .bashrc
#PATH=$PATH:/usr/libexec/p7zip:$HOME/repos/tux_scripts
#export PATH

if [ -d "$HOME/.trash/$1" ]; then
    rm -r "$HOME/.trash/$1"
fi

mv --target-directory=$HOME/.trash/ -- "$@"



#mv $@ ~/Trash/
