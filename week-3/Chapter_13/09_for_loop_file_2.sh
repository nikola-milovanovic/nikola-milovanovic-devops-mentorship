#!/bin/bash
#Read values from file change field separator

file="states"

IFS=$'\n'

for state in $(cat $states2)
do
    echo "Visit beautiful $state"
done
    