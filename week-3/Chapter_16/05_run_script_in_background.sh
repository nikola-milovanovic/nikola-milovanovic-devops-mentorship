#!/bin/bash
#Run in the background, place an ampersand symbol (&) after command to run script


count=1
while [ $count -le 10 ]
do
    sleep 1
    count=$[ $count + 1 ]
done
