#! /usr/bin/bash

input_file="files/reponame.csv"
arr=()
count=0
while read line || [ -n "$line" ]
do
	var="$line"
	#echo "$var"
	#echo $count
	arr[$count]="$var"
	count=$(($count+1))
done < "$input_file"

read -p 'Username: ' uservar;
read -p 'Token: ' token;
echo "Press enter if it's user account"
read -p 'Organization: ' org;

if [ -z "$org" ]
then
	for i in ${arr[@]}
	do
	  #echo "$i"
	  repo=$(echo "$i" | sed -e 's/\r//g')
	  #echo $repo
	  curl  -u ''${uservar}':'${token}'' https://api.github.com/user/repos -d '{"name":"'"$repo"'"}'
	done
else
	for i in ${arr[@]}
	do
	  #echo "$i"
	  repo=$(echo "$i" | sed -e 's/\r//g')
	  #echo $repo
	  curl  -u ''${uservar}':'${token}'' https://api.github.com/orgs/${org}/repos -d '{"name":"'"$repo"'"}'
	done
fi
