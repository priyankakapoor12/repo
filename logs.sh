#!/bin/bash

# Colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"
NC="\e[0m"

# Log Directory & File
LOGS_FOLDER="/var/log/shell"
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/SCRIPT-LOGS-$TIMESTAMP.log"

# Function: Validate Exit Status
VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$2 ..... ${R}failure${NC}"
        exit 1
    else
        echo -e "$2 ..... ${G}success${NC}"
    fi
}

# Create log folder if missing
if [ ! -d "$LOGS_FOLDER" ]; then
    mkdir -p "$LOGS_FOLDER"
    VALIDATE $? "Creating logs directory"
fi

# Start Logging
echo "Script started at $(date)" &>>$LOG_FILE_NAME

# Check root user
USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo -e "${R}ERROR: Run as root${NC}"
    exit 1
fi

# ============================================
echo -e "${Y}Updating system packages...${NC}"
apt update -y &>>$LOG_FILE_NAME
VALIDATE $? "Updating package list"

# ============================================
echo -e "${Y}Installing MySQL Server...${NC}"
apt install mysql-server -y &>>$LOG_FILE_NAME
VALIDATE $? "MySQL Server installation"

# ============================================
echo -e "${Y}Installing NGINX...${NC}"
apt install nginx -y &>>$LOG_FILE_NAME
VALIDATE $? "NGINX installation"

echo -e "${G}All tasks completed successfully! Logs saved to: $LOG_FILE_NAME${NC}"
