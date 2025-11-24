#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
NC="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/script-logs-$TIMESTAMP.log"

mkdir -p $LOGS_FOLDER

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$2 ..... ${R}failure${NC}"
        exit 1
    else
        echo -e "$2 ..... ${G}success${NC}"
    fi
}

if [ $# -eq 0 ]; then
    echo -e "${Y}Usage: $0 <package1> <package2> ...${NC}"
    exit 1
fi

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo -e "${R}ERROR: Run as root${NC}"
    exit 1
fi

echo "$(date) : Script execution started" >> $LOG_FILE_NAME

echo -e "${Y}Updating apt repository...${NC}"
apt update &>>$LOG_FILE_NAME
VALIDATE $? "System update"

for package in "$@"
do
    echo "$(date) : Checking $package" >> $LOG_FILE_NAME

    if command -v $package &>/dev/null; then
        echo -e "$package already installed... ${Y}skipping${NC}"
        continue
    fi

    apt install $package -y &>>$LOG_FILE_NAME
    VALIDATE $? "$package"
done

echo -e "${G}All tasks completed successfully!${NC}"
echo "$(date) : Script completed" >> $LOG_FILE_NAME
