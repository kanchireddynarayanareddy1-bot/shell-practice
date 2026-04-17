#!/bin/bash

UserId=$(id -u) 
R="\e[031m"
G="\e[032m"
Y="\e[033m"
N="\e[0m"

Folder="/var/log/shell-script"
ScriptName=$(echo $0 | cut -d'.' -f1)
LogFile="$Folder/$ScriptName.log"  
 
mkdir -p $Folder
echo "Script execution started at: $(date)" | tee -a $LogFile   

if [ $UserId -ne 0 ]; then
    echo "you can give sudo access to this script to run as root user" | tee -a $LogFile
fi
validate (){
   if [ $1 -ne 0 ]; then
    echo -e "Installation $2 $R failed $N" | tee -a $LogFile
else
    echo -e "Installation $2 $G successful $N" | tee -a $LogFile
fi 
}
for package in $@ 
do
    dnf list installed $package  &>>$LogFile
    if [ $? -ne 0 ]; then
        {
            dnf install $package -y &>>$LogFile
            validate $? "$package"
        }
    else
        echo -e "$package already exist ... $Y SKIPPING $N" | tee -a $LogFile
    fi
done