# Migration: Other web based git version control systems to GitHub

Only commits, branches, tags will be imported, users may be mapped if you'd like!

Folder struture
  * Root Folder
    * files
      * exportlinks.csv
      * links.csv
      * reponame.csv
    * repos (cloned repos will be saved in this folder, create one when imported)
    * curl.sh
    * main.sh
    * modify.py
  
### Notes
* Make sure path to the files are correct
* Cloning via HTTPS or SSH is available
* links.csv if the list of repositories which you have to migrate
* Create token to authenticate for creating repositories (in curl.sh file)
* Importing to User account or Organization is available

## How to run ?
Run main.sh file and provide correct inputs as you go along
