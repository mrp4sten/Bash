#!/bin/bash
# author: mrp4sten

# Arguments ara a specific positions
# commands can take in arguments at a specific
# position, counting from one (0 reserved for the shell)

# to test this we recommend you that execute the following command in the shell
# ./3_Positional_Arguments.sh <Your Name> <Your Lastname>
# example: ./3_Positional_Arguments Mauricio Pasten
echo Hello $1 $2
