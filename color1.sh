#!/bin/bash
R="\e[31m"
G="\e[32m"
B="\e[33m"
NC="\e[0m"

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$2 ..... $R failure${NC}"
        exit 1
    else
        echo -e "$2 ..... $G success${NC}"
    fi
}

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: You must have root access to execute this script"
    exit 1
fi

echo "Installing java..."
apt install default-jre -y
VALIDATE $? "Installing java"

