#!/bin/bash

#Task 1: Comments
# This is a comment.
# Happy New Year Guys!!
#
#

#Task 2: echo

echo -e "Happy New Year 2026 !! \n"

# Task 3: Variables
#
NAME="Batman"
AGE=24
CITY="Gotham City"

TODAY=$(date)

echo "Name: $NAME"
echo "Age: $AGE"
echo "City: $CITY"
echo "Today's date: $TODAY"


# Task 4: Using Variables
#
# Take inputer from the user
echo "Enter the first Number: "
read num1

echo "Enter a second Number: "
read num2

# Calculate the sum
SUM=$((num1 + num2))

#Print the result

echo "The sum is: $SUM"

# Task 5: Using Built-in Variables
#
echo "User is: $(whoami)"
echo "Current Directory is: $PWD"
echo "Hostname is: $HOSTNAME"

# Task 6: Wildcards
# List all the files with a specfic extension
#
# Ask the user for the file extension
#
echo " Enter file extension (e.g., txt, sh, log):"
read ext

echo "File with .$ext extension in the currect directory: "
ls *.$ext
