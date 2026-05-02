#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo " ERROR: your not root user, please run as root user"
    exit 1 #failure is other than 0 like (1,2,3,4,5,6,7,8,9)
fi

dnf install mysql -y

if [$? -ne 0 ];then
    echo "ERROR: mysql installation failed"
    exit 1 #failure is other than 0 like (1,2,3,4,5,6,7,8,9)
else
    echo "MYSQL installation is successful"
fi

