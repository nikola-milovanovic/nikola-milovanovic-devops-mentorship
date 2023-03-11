#!/bin/bash
#Test multy function script

name = (basename $0)

if [ $name = "nikola" ]
then
    total=$[ $1 + $2 ]
elif [ $name = "multem" ]
then
    total=$[ $1 * $2 ]
fi
echo The calculated value is $total
