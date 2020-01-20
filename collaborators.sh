#! /usr/bin/bash

# Code to add a collaborator from the reponame.csv list of repositories with a permission pull, push or admin

input_file="files/reponame.csv"

# owner = ""		# User or Organization name
# name  = ""		# Collaborator you want to add
# perm  = ""		# Permission

# Authentication
read -p 'Username: ' uservar;
read -p 'Token: ' token;
# Required details for the user to add the collaborator
read -p 'Enter the Owner: ' owner;		# Owner may be organization name or the github account user name
read -p 'Enter name of collaborator: ' name;		# Name of collaborator
read -p 'Enter the permission, allowed permissions are pull, push, admin ' perm;		# Permission

while read line || [ -n "$line" ]
do
	var="$line"
	arr[$count]="$var"
	count=$(($count+1))
done < "$input_file"


for i in ${arr[@]}
	do
	  repo=$(echo "$i" | sed -e 's/\r//g')
	  
	  curl -u ''${uservar}':'${token}'' -X PUT https://api.github.com/repos/${owner}/${repo}/collaborators/${name} -d '{"permission":"'"$perm"'"}'
	done

# curl -u '${uservar}':'${token}' -X PUT https://api.github.com/repos/${owner}/${repo}/collaborators/${name} -d '{"permission":"'"$perm"'"}'
