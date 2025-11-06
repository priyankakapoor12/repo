#!/bin/bash
CORRECT_USER=Priyanka
CORRECT_PASSWORD=Priya

echo "Enter Username: "
read USERNAME

echo "Enter Password: "
read PASSWORD
echo

#USERNAME CHECK
if [[ "$USERNAME" != "$CORRECT_USER"]]; then
echo "Incorrect Username!"
exit 1
fi

#PASSWORD CHECK
if [[ "$PASSWORD" != "$CORRECT_PASSWORD"]]; then
echo "Incorrect Password!"
exit 1

fi

echo "Login successfull!"
echo "Welcome, $USERNAME!"

