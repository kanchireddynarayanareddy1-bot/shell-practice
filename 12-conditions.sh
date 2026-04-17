#!/bin/bash
R="\e[031m"
G="\e[032m"
Y="\e[033m"
N="\e[0m"
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
    echo -e "Installation $2 ...$R failed $N" | tee -a $LogFile
else
    echo -e "Installation $2 ...$G successful $N" | tee -a $LogFile
fi 
}
dnf list installed mysql &>>$LogFile
if [ $? -ne 0 ]; then
{
    dnf install mysql -y &>>$LogFile
    validate $? "mysql"
}
else
    echo -e "Mysql already exist...$Y SKIPPING $N" | tee -a $LogFile
fi
dnf list installed nginx &>>$LogFile
if [ $? -ne 0 ]; then
{
    dnf install nginx -y &>>$LogFile
    validate $? "nginx"
}
else
    echo -e "Nginx already exist...$Y SKIPPING $N" | tee -a $LogFile
    exit 1
fi
