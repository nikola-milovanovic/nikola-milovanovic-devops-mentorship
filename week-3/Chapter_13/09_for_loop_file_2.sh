#!/bin/bash
#Read values from file change field separator

file="states2"

IFS=$'\n'

for state in $(cat $file)
do
    echo "Visit beautiful $state"
done
    