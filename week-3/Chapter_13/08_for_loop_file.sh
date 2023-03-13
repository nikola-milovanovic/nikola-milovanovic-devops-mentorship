#!/bin/bash
#Reading values from file

file="states"

for state in $(cat $file)
do
    echo "Visit beautiful $state"
done
