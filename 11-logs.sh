#!/bin/bash

UserId=$(id -u)
R="\e[031m"
G="\e[032m"
Y="\e[033m"
N="\e[0m"  
 Logs_Folder="/var/log/shell-script"
 Script_Name=$(echo $0 | cut -d'.' -f1)
 Log_File="$Logs_Folder/$Script_Name.log"

 mkdir -p $Logs_Folder
 echo "Script execution started at: $(date)" | tee -a $Log_File
if [ $UserId -ne 0 ]; then
    echo "you can give sudo access to this script to run as root user"
    exit 1 
fi

validate (){
   if [ $1 -ne 0 ]; then
    echo -e "Installation $2 $R failed $N" | tee -a $Log_File
else
    echo -e "Installation $2 $G successful $N" | tee -a $Log_File
fi 
}

dnf list installed mysql &>>$Log_File 
if [ $? -ne 0 ]; then
{
    dnf install mysql -y &>>$Log_File
    validate $? "mysql"
}
    
else
    echo -e "MySQL already exist ... $Y SKIPPING $N" | tee -a $Log_File
fi
dnf list installed nginx &>>$Log_File
if [ $? -ne 0 ]; then
{
    dnf install nginx -y &>>$Log_File
    validate $? "nginx"
}
    
else
    echo -e "Nginx already exist ... $Y SKIPPING $N" | tee -a $Log_File
fi

dnf list installed python3 &>>$Log_File
if [ $? -ne 0 ]; then
{
    dnf install python3 -y &>>$Log_File
    validate $? "python3"
}
    
else
    echo -e "Python3 already exist ... $Y SKIPPING $N" | tee -a $Log_File
fi