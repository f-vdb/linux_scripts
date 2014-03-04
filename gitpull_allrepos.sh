#!/bin/bash

cd ~/repos/
# echo `pwd`

for i in $(find . -maxdepth 1 -mindepth 1 -type d); do
    echo $i;
    cd $i;
    git pull origin master;
    cd ..
    echo;
done

