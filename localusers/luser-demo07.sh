#!/bin/bash

# Demonstrate the use of shift and while loops

# Display the first three parameters
echo "Paramters 1: ${1}"
echo "Paramters 2: ${2}"
echo "Paramters 3: ${3}"
echo 

# Loop through all the positional parameters

# while [[ "${#}" -gt 0 ]]
# do 
#     echo "Number of parameters: ${#}"
#     echo "Paramters 1: ${1}"
#     echo "Paramters 2: ${2}"
#     echo "Paramters 3: ${3}"
#     echo
#     shift
# done