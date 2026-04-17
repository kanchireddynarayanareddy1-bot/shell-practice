#!bin/bash

UserId=$(id -u)
R="\e[031m"
G="\e[032m"
Y="\e[033m"
N="\e[0m"
Folder="/var/log/Shell-Automate"
ScriptName=$(echo $0 | cut -d'.' -f1)
LogFile="$Folder/$ScriptName.log"
mkdir -p $Folder
echo "Script execution started at: $(date)" | tee -a $LogFile


