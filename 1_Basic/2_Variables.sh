#!/bin/bash
# author: mrp4sten

# Saving a values into a variable
FIRST_NAME=Mauricio
LAST_NAME=Pasten
echo Hello $FIRST_NAME $LAST_NAME

# To save or read the input from a user
# we can use the command [read]
echo what is your name?
read INPUT_FIRST_NAME
echo what is your lastname?
read INPUT_LAST_NAME
echo Your name is $INPUT_FIRST_NAME $INPUT_LAST_NAME
