#!/bin/bash
USERID=$(id - u)
if [ $USERID -ne 0 ]
then
echo "Error: You must have sudo access to run this script"
exit 1
else
echo "Proceeding further.."
fi
apt update -y
apt install mysql-server -y
if [ $? -ne 0 ]
then
echo "Installing mysql failed.."
exit 1
else
echo "Installing MySql... Success"
fi
apt install nginx -y
if [ $? -ne 0 ]
then
echo "Installing nginx... Failure"
exit 1
else
echo "Intalling Nginx... Success"
fi

#JAVA
apt install default-jre
if [ $? ne 0 ]
then
echo "Failure"
exit 1
else
echo "Success"
fi


