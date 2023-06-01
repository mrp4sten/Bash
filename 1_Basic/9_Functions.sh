#!/bin/bash
# author: mrp4sten

# Function to greet a person
greet_person() {
  local name=$1
  echo "Hello, $name!"
}

# Function to calculate the sum of two numbers
add_numbers() {
  local num1=$1
  local num2=$2
  local sum=$((num1 + num2))
  echo "The sum of $num1 and $num2 is: $sum"
}

# Function to check if a number is even or odd
check_even_odd() {
  local number=$1
  if ((number % 2 == 0)); then
    echo "$number is even."
  else
    echo "$number is odd."
  fi
}

# Call the functions
greet_person "Alice"
add_numbers 5 3
check_even_odd 7
