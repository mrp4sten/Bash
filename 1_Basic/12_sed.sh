#!/bin/bash

# Path to the input text file
input_file="data.txt"

# Use sed to perform text transformations
sed '
    # Remove leading whitespace from each line
    s/^[[:space:]]*//

    # Replace all occurrences of "apple" with "orange"
    s/apple/orange/g

    # Append a prefix "Hello " to lines starting with "Name:"
    /^Name:/ s/^/Hello /

    # Delete lines containing the word "banana"
    /banana/ d
' "$input_file"
