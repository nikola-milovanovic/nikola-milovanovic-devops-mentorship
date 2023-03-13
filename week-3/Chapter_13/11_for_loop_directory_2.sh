#!/bin/bash
#Iterate through multiple directories

for file in /home/centos/* /home/centos/week-3/*
do
    if [ -d "$file" ]
    then
        echo "$file is a directory"
    elif [ -f "$file" ]
    then
        echo "$file is a file"
    else
        echo "$file doesen't exist"
    fi
done