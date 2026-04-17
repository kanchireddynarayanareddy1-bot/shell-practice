#!/bin/bash
R="\e[31m"
G="\e[32m"
userId=$(id -u)
Folder="/var/log/shell-script"
ScriptName=$(echo $0 | cut -d'.' -f1)
LogFile="$Folder/$ScriptName.log"

mkdir -p $Folder
echo "Script execution started at: $(date)" | tee -a $LogFile
if [ $userId -ne 0 ]; then
    echo "you can give sudo access to this script to run as root user"
    exit 1 
fi
validate (){
   if [ $1 -ne 0 ]; then
    echo "Installation $2...$R failed $N" | tee -a $LogFile
else
    echo "Installation $2...$G successful $N" | tee -a $LogFile
fi 
}
dnf list installed mysql &>>$LogFile
if [ $? -ne 0 ]; then
{
    dnf install mysql -y &>>$LogFile
    validate $? "mysql"
}
else
    echo "Mysql already exist...$Y SKIPPING $N" | tee -a $LogFile
    exit 1
fi
