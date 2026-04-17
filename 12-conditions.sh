#!/bin/bash
R="\e[31m"
G="\e[32m"
userId=$(id -u)
if [ $userId -ne 0 ]; then
    echo "you can give sudo access to this script to run as root user"
    exit 1 
fi
dnf install mysql -y
 if [ $? -ne 0 ]; then
    echo "Mysql Installation..."$R failed $N "

else
    echo "Mysql Installation..."$G successful $N "
fi  