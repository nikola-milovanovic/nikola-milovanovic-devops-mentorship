#!/bin/bash
#Demonstrating a multi-position shift


echo "The original parameters: $*"
shift 2
echo "Here's the new first parameter: $1"
