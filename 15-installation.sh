#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script execution started at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo " ERROR: your not root user, please run as root user"
    exit 1 #failure is other than 0 like (1,2,3,4,5,6,7,8,9)
fi

# dnf install mysql -y
# if [ $? -ne 0 ];then
#    echo "ERROR: mysql installation failed"
#     exit 1 #failure is other than 0 like (1,2,3,4,5,6,7,8,9)
# else
#     echo "MYSQL installation is successful"
# fi

# dnf install nginx -y

# if [ $? -ne 0 ];then
#     echo "ERROR: nginx installation failed"
#     exit 1 #failure is other than 0 like (1,2,3,4,5,6,7,8,9)
# else
#     echo "NGINX installation is successful"
# fi
 
VALIDATE(){
    if [ $1 -ne 0 ];then
      echo -e " ERROR: $2 installation $R FAILURE $N" | tee -a $LOG_FILE
      exit 1 #failure is other than 0 like (1,2,3,4,5,6,7,8,9)
    else
      echo -e " $2 installation is  $G SUCCESS $N"  | tee -a $LOG_FILE
    fi
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ];then
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e"MYSQL is already installed $Y SKIPPING $N"  | tee -a $LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ];then
    dnf install nginx -y
    VALIDATE $? "NGINX"
else
    echo -e"NGINX is already installed $Y SKIPPING $N"  | tee -a $LOG_FILE
fi
