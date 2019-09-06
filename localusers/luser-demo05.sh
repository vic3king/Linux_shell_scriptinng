#!/bin/bash

# Generate a list of random passwords

# Random numbre as a password
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"

# Use the current date and time as basis for the password
PASSWORD=$(date +%s)
echo "${PASSWORD}"

# Use nanoseconds to act as randomization
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

# Create a better password
PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo "${PASSWORD}"

# An even better password
c
echo "${PASSWORD}"

# Append a special character to the password
SPECIAL_CHAR=$(echo '!@#$%67890-=' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHAR}"

