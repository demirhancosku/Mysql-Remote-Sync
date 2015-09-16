#!/bin/bash

# OSX Mysql MAMP Lib
export PATH=$PATH:/Applications/MAMP/Library/bin/


# Database Credentials
host=""
user=""
password=""
remote_db_name=""
local_db_name=""

# Settings
backup_path="backups"
date=$(date +"%d-%b-%Y")

# File Permission
umask 177

# .SQL dump
mysqldump --user=$user --password=$password -h $host  $remote_db_name > $backup_path/$local_db_name-$date.sql

# Delete old files  10 = days
find $backup_path/* -mtime +10 -exec rm {} \;

# Restore Local Database
mysql -u root -p $local_db_name < $backup_path/$local_db_name-$date.sql
