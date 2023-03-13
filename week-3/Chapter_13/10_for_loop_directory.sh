#!/bin/bash
#Iterate through all the files in a directory and print type of files

for file in /home/centos/*
do
    if [ -d "$file" ]
    then
        echo "$file is a directory"
    elif [ -f "$file" ]
    then
        echo "$file is a file"
    fi
done
