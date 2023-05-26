#!/bin/bash
# author: Mauricio Pasten(mrp4sten)

# [echo] is aommand that allow display text
echo "Hello world"

# [cat] is a command that allow display the content from a file text
cat ~/.bashrc

# [mkdir] is used to make directories
mkdir test_mkdir

# [touch] is used to make files
touch test_touch.txt

# to save an output from a command we can use [>]
# for example:
echo "saving an output" >./savingOutput.txt

# to overwrite in the previous file or add content
# we can use [>>] for example:
echo "overwriting file" >>./savingOutput.txt

# You can see the list of your files with [ls] command
ls ~/

# You can read the manual of many commands with the [man] command
man ls

# But I recommend you that install in your system [tldr]
# Because instead of [man] you can see examples of the many
# commands using it.
tldr ls
