#!/bin/bash

# This script creates a new user on the local system
# You must supply a username as an argument
# Optionally, you can also provide a comment for the account as an argument
# A password will be auto generated for the user account
# Check if the user is accessing the script with sudo priviledges
if [[ $UID -ne 0 ]];
then
    echo "Only administrators can perform this action" >&2
    exit 1
fi

# Make sure they supply atleast one argument.
NUM_OF_PARAMETERS="${#}"
if [[ "${NUM_OF_PARAMETERS}" -lt 2 ]]
then
    echo "Usage: ${0} USER_NAME [COMMENT]..." >&2
    exit 1
else
# The first parameter is the user name
    USER_NAME="${1}"
# The fshift the first parameter and select the rest as one
    shift
    COMMENT="${@}"
# Generate a pssword for the user
    PASSWORD=$(date +%s%N | sha256sum | head -c32)
# create the user and also create save the password
    useradd -c "$COMMENT" -m ${USER_NAME} &> /dev/null
    # Set the password for the user
    echo ${PASSWORD} | passwd --stdin ${USER_NAME} &> /dev/null
    passwd -e ${USER_NAME} &> /dev/null
fi

# Test if the command succeded
if [[ "$?" -eq 1 ]]
then
    echo 'The command did not excecute succesfully' >&2
    exit 1
else
    echo "The user with the following details Username: ${USER_NAME}, Password: ${PASSWORD} Hostname: $(hostname) has been created"
fi
