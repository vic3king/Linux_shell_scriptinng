#!/bin/bash

# Display the UID and the username of the user excecuting this script.
# Display if the user is the vagrant user or not

# Display the UID
echo "Your UID is ${UID}"


# Only display if the uid does NOT match 1000
UID_TO_TEST_FOR='1000'

if [[ "${UID}" -ne $UID_TO_TEST_FOR ]]
then
    echo "You UID does not match ${UID_TO_TEST_FOR}"
    exit 1
fi


# Display the username
USER_NAME=$(id -un)

# Test if the command succeded
if [[ "$?" -ne 0 ]]
then
    echo 'The id command did not excecute succesfully'
    exit 1
fi

echo "Your username is $USER_NAME"

# You can use a string test conditional
USER_NAME_TO_TEST_FOR='vagrant'

if [[ "${USER_NAME}" -eq $USER_NAME_TO_TEST_FOR ]]
then
    echo "You username matches ${USER_NAME_TO_TEST_FOR}"
fi

# Test for != for the string
if [[ "${USER_NAME}" != $USER_NAME_TO_TEST_FOR ]]
then
    echo "You username does not match ${USER_NAME_TO_TEST_FOR}"
    exit 1
fi

exit 0