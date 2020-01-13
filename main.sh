#! /usr/bin/bash

# Git pull
input_file_pull="../files/links.csv"
cd repos
while read line || [ -n "$line" ]			# "IFS= read -r line" will not work as it will leave the last line, referencing -n as the last line
do
  echo "$line"
  git clone --bare $line
done < "$input_file_pull"
cd ..

# Modifying the URL and storing in CSV file
python modify.py

echo "Press enter to continue"
read -s -n 1 key  # -s: do not echo input character. -n 1: read only 1 character (separate with space)

# Creating the new repositories
./curl.sh

# Mirror Push the cloned repositories
input_file_push="../files/exportlinks.csv"
input_dir="../files/reponame.csv"
cd repos
count=0
arr=()

while read line || [ -n "$line" ]
do
  dirc=$(echo "$line" | sed -e 's/\r//g')
  echo "$dirc"
  arr[$count]="$dirc"
  arr[$count]="${arr[${count}]}.git"
  count=$(($count+1))
done < "$input_dir"

sCount=0
# echo ${arr[${sCount}]}

while read line || [ -n "$line" ]
do
  link=$(echo "$line" | sed -e 's/\r//g')
  echo "$link"
  cd ${arr[${sCount}]}
  echo ${arr[${sCount}]}
  sCount=$(($sCount+1))
  git push --mirror $link
  cd ..
done < "$input_file_push"

# Check the files/links.csv file for the git pull repositories
# Check the files/reponame.csv for the repository names
# Check the files/exportlinks.csv file for the repository URLs