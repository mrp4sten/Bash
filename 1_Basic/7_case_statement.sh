#!/bin/bash
# author: mrp4sten
read -p "Enter a fruit: " fruit

#!/bin/bash

while true; do
  read -p "Enter a fruit: " fruit

  case $fruit in
  apple)
    echo "You chose an apple."
    break
    ;;
  banana)
    echo "You chose a banana."
    break
    ;;
  orange | lemon)
    echo "You chose an orange or a lemon."
    continue
    ;;
  *)
    echo "You chose an unknown fruit."
    continue
    ;;
  esac
done
