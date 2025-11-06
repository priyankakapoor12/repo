#!/bin/bash
USERID=$(id - u)
if [ $USERID -ne 0 ]
then
echo "Error: You must have sudo access to run this script"
fi
apt update -y
apt install mysqll
apt install nginx -y

