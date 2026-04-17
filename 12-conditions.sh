#!/bin/bash
R="\e[31m"
G="\e[32m"
userId=$(id -u)
Folder="/var/log/shell-script"
ScriptName=$(echo $0 | cut -d'.' -f1)
LogFile="$Folder/$ScriptName.log"
if [ $userId -ne 0 ]; then
    echo "you can give sudo access to this script to run as root user"
    exit 1 
fi
mkdir -p $Folder
echo "Script execution started at: $(date)" | tee -a $LogFile
dnf install mysql -y &>>$LogFile
 if [ $? -ne 0 ]; then
    echo "Mysql Installation..."$R failed $N" 

else
    echo "Mysql Installation..."$G successful $N "
fi  