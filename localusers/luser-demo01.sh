#!/bin/bash

# This script displays various information to the screen
echo 'Hello'

# Assign a value to a variable
WORD='script'

# Display that value using the variable
echo "$WORD"

# Combine the variable wit hard coded text.
echo "This is a shell $WORD"

# Dispay the contents of the variable using an alternative syntax
echo "This is a shell ${WORD}"

# Append text to variable.
echo "${WORD}ing is fun!"

# Show how NOT to append text to a variable.
# This doesn't work:
echo "$WORDing is fun!"

# Create a new variable
ENDING='ed'

# Combine the two variables 
echo "This is ${WORD}${ENDING}."

# Change the value stored in the ENDING variable (reassignment)
ENDING='ing'
echo "This is ${WORD}${ENDING}."

# Reassign value to ENDING
ENDING='s'
echo "You are going to write many ${WORD}${ENDING} in this class!"