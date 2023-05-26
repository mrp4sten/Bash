#!/bin/bash
# author: mrp4sten
read -p "Enter a fruit: " fruit

case $fruit in
apple)
  echo "You chose an apple."
  ;;
banana)
  echo "You chose a banana."
  ;;
orange | lemon)
  echo "You chose an orange or a lemon."
  ;;
*)
  echo "You chose an unknown fruit."
  ;;
esac
