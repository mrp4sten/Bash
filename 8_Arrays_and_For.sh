#!/bin/bash
# author: mrp4sten

# Declare an array of fruits
fruits=("apple" "banana" "orange" "lemon")

# Access and print individual elements
echo "First fruit: ${fruits[0]}"
echo "Second fruit: ${fruits[1]}"
echo "Third fruit: ${fruits[2]}"
echo "Fourth fruit: ${fruits[3]}"

# Iterate over all elements
echo "All fruits:"
for fruit in "${fruits[@]}"; do
  echo $fruit
done

# Get the length of the array
length=${#fruits[@]}
echo "The length of the array is $length"

# Modify an element
fruits[2]="grape"
echo "Updated third fruit: ${fruits[2]}"

# Append new elements
fruits+=("kiwi" "pineapple")
echo "Updated fruits:"
for fruit in "${fruits[@]}"; do
  echo $fruit
done
