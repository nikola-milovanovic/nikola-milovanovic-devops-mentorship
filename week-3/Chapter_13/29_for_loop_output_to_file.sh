#!/bin/bash
#Redirect output of for loop into file


for ((a=1; a<10; a++))
do
    echo "The number is $a"
done > output
