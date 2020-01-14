#! /usr/bin/env python

import csv
import sys

arr         = [ ]
strArr      = [ ]
sStrArr     = [ ]
link        = [ ]
wordCount   = 0

def string_reverse(revString):
  return revString[::-1]

with open('files/links.csv') as csvfile:				# Change the CSV File link
    readCSV = csv.reader(csvfile, delimiter=',')
    for row in readCSV:
        arr.append(row[0])
'''
for x in arr:
    slashCount = 0
    str = ""
    for i in arr[wordCount]:
        #print(i)
        if(i == r'/'):
            #print(i)
            slashCount = slashCount + 1
        if(slashCount == 4):                            # Count the exact match of Slash and enter the number
            #print(i)
            str = str + i
            #print(str)
    strArr.append(str)
    wordCount = wordCount + 1

for y in strArr:
    mStr = y
    sStr = ""
    for z in mStr:
        if(z == r'/'):
            continue
        if(z == r'.'):
            break
        sStr = sStr + z
    sStrArr.append(sStr)
    #print(sStr)

ln = len(sStrArr)
sCount = 0
with open('files/reponame.csv', mode='w') as repo_file:
    for u in sStrArr:
        sCount = sCount + 1
        repo_file.write(u)
        if(sCount < ln):
            repo_file.write('\n')
'''

count = 0
for x in arr:
    arr[count] = string_reverse(x)
    count += 1

count = 0
for x in arr:
    startIndex = arr[count].index(r'.') + 1
    endIndex = arr[count].index(r'/')
    str = arr[count][startIndex:endIndex]
    count = count + 1
    strArr.append(str)

count = 0
for x in strArr:
    strArr[count] = string_reverse(x)
    count += 1

# Adding the preceding GitHub Cloud link before the repository
try:
	plink = input("Please enter the preceding GitHub link\nIf HTTPS: https://github.com/account_name\nIf SSH:git@github.com:account_name\nI you want to exit type Ctrl+C and then Enter\n")
	
except KeyboardInterrupt:
	print("Exited")
	sys.exit()

plinkLen = (len(plink) - 1)
k = plink[plinkLen]

if (k == r'/'):
    pass
else:
    plink = plink + "/"

for x in strArr:
    slink = plink + x + ".git"
    link.append(slink)
    #print(link)

#exportlinks.csv
ls = len(link)
count = 0
with open('files/exportlinks.csv', mode='w') as export_file:
    for v in link:
        count = count + 1
        export_file.write(v)
        if(count < ls):
            export_file.write('\n')
