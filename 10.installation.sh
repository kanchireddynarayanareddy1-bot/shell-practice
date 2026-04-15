#!/bin/bash
R="\e[031m"
G="\e[032m"
Y="\e[033m"
N="\e[0m" 
UserId=$(id -u)

if [ $UserId -ne 0 ]; then
    echo "you can give sudo access to this script to run as root user"
    exit 1
fi

validate (){
   if [ $1 -ne 0 ]; then
    echo -e "Installation $2 $R failed $N"
else
    echo -e "Installation $2 $G successful $N"
fi 
}

dnf list installed mysql
if [ $? -ne 0 ]; then
{
    dnf install mysql -y
    validate $? "mysql"
}
    
else
    echo -e "MySQL already exist ... $Y SKIPPING $N"
fi
dnf list installed nginx
if [ $? -ne 0 ]; then
{
    dnf install nginx -y
    validate $? "nginx"
}
    
else
    echo -e "Nginx already exist ... $Y SKIPPING $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
{
    dnf install python3 -y
    validate $? "python3"
}
    
else
    echo -e "Python3 already exist ... $Y SKIPPING $N"
fi

