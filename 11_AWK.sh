#!/bin/bash

# Path to the input text file
input_file="data.txt"

# Use AWK to process the input file
awk '
    BEGIN {
        # Print header
        print "Name\tAge\tCity"
    }
    {
        # Extract and print specific fields
        name = $1
        age = $2
        city = $3
        print name "\t" age "\t" city
    }
' "$input_file"
