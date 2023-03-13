#!/bin/bash
#Testing input/output file descriptor


exec 3<> testfile2
read line <&3
echo "Read: $line"
echo "This is a test line" >&3
