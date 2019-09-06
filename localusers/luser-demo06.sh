#!/bin/bash

# this script generates a random passowrd for each user specified in the command line

# Display what the user typed on the command line
echo "You excecuted this command: ${0}"

# display the path and file name of the script
echo "You used $(dirname ${0}) as the path to the $(basename ${0}) script"

# Tell the user how many arguments they passed in
# (Inisde the script they are parameters, outside theu are arguments)
NUM_OF_PARAMETERS="${#}"
echo "You supplied ${NUM_OF_PARAMETERS} argument(s) on the command line."

# Make sure they supply atleast one argument.
if [[ "${NUM_OF_PARAMETERS}" -lt 1 ]]
then
    echo "Usage: ${0} USER_NAME [USER_NAME]..."
    exit 1
fi

# generate and display a password for each parameter
for USER_NAME in "${}"
do
    PASSWORD=$(date +%s%N | sha256sum | head -c48)
    echo "${USER_NAME}: ${PASSWORD}"
done