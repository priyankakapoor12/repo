#!/bin/bash

CORRECT_USER="Priyanka"
CORRECT_PASSWORD="Priya"

echo -n "Enter Username: "
read USERNAME

echo -n "Enter Password: "
read PASSWORD
echo

# USERNAME CHECK
if [[ "$USERNAME" != "$CORRECT_USER" ]]; then
  echo "Incorrect Username!"
  exit 1
fi

# PASSWORD CHECK
if [[ "$PASSWORD" != "$CORRECT_PASSWORD" ]]; then
  echo "Incorrect Password!"
  exit 1
fi

echo "Login successful!"
echo "Welcome, $USERNAME!"

