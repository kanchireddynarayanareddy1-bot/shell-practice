#!/bin/bash

UserId=$(id -u)

if [ $UserId -ne 0 ]; then
    echo "you can give sudo access to this script to run as root user""
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Installation failed"
else
    echo "Installation successful"
fi




