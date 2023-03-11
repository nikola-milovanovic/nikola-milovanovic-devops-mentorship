#!/bin/bash
#Changing the IFS value

IFS.OLD=$IFS
IFS=$'\n'

for entry in $(cat /home/centos/week-3)
do
    echo "Values in $entry –"
    IFS=:
    for value in $entry
    do
        echo " $value"
    done
done
