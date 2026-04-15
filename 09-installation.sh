#!/bin/bash

Number=$(id -u)

if [ $Number -ne 0 ]; then
    echo "you can give sudo access to this script to run as root user""
fi

 dnf install mysql -y

 if [ $? -ne 0 ]; then
    echo "Installation failed, please check the error message"
 else
    echo "Installation successful"
 fi 

