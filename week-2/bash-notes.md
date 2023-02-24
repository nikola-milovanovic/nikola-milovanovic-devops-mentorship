ls -#list files in current directory

cat <filename> -#print in terminal file content

cat ./- -#print in terminal file content, when filename starts with dash

cat "spaces in this filename" -#print in terminal file content, when filename has spaces

find -type f | xargs file | grep text -#find files that have human readable text inside

find . -type f -readable -size 1033c ! -executable  -#find file that has properties: human-readable, 1033 bytes, non-executable

find / -user bandit7 -group bandit6 -size 33c   -#find file that has properties: human-readable, 1033 bytes, non-executable

grep millionth data.txt  -#search String in file data.txt

sort data.txt | uniq -c  -#sort strings and show how many occurencies word has

strings data.txt | grep "="  -#return String that starts with charachter =

base64 -d data.txt  -#decode text from file
