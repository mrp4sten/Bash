#!/bin/bash
# author: Mauricio Pasten (mrp4sten)

# getting the name of the file into compressed file
name_compressed=$(7z l content.gzip | grep "Name" -A 2 | tail -n 1 | awk 'NF{print $NF}')
7z x $name_compressed >/dev/null 2>&1 #[2>&1] us used to redirect <stderr> to <stdin>

while true; do
  7z l $name_compressed >/dev/null 2>&1
  #[echo $?] print the output code from previous command
  if [ "echo $?" == "0" ]; then
    decompressed_next=$(7z l name_compressed | grep "Name" -A 2 | tail -n 1 | awk 'NF{print $NF}')
    7z x $name_compressed >/dev/null 2>&1 && $name_compressed=$decompressed_next
  else
    exit 1
  fi
done
