#!/bin/bash
#Read values from file change field separator

file="states"

IFS=$'\n'

for state in $(cat $file)
do
    echo "Visit beautiful $state"
done
    