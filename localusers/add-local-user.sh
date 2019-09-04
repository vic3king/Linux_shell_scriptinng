#!/bin/bash

# This script creates a new user on the local system

# Check if the user is accessing the script with sudo priviledges
if [[ $UID -ne 0 ]];
then
    echo "Only administrators can perform this action"
    exit 1
fi

# Ask for the user name
read -p 'Enter the username to create: ' USER_NAME

# Ask for the real name
read -p 'Enter the name of the person who this account is for: ' COMMENT

# Ask for the password
read -p 'Enter the password of the account: ' PASSWORD

# Create the user
useradd -c "$COMMENT" -m ${USER_NAME}

# Create the user
useradd -c "$COMMENT" -m ${USER_NAME}

# Force password change on first login
passwd -e ${USER_NAME}

# Test if the command succeded
if [[ "$?" -eq 1 ]]
then
    echo 'The command did not excecute succesfully'
    exit 1
else
    echo "The user with the following details Username: ${USER_NAME}, Password: ${PASSWORD} Hostname: $(hostname) has been created"
fi

# Set the password for the user
echo ${PASSWORD} | passwd --stdin ${USER_NAME}