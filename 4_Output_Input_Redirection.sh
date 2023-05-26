#!/bin/bash
# author: mrp4sten

# PIPING
# The flow in the Piping is so easy
# Basically fisrt you write the first command
# After you use the pipe symbol, and finally you can use other command

# please don't execute the file, instead can you put the follow
# commad in your own terminal.
echo Hello there | grep there

# Output redirection
echo "saving an output" >./savingOutput.txt
echo "overwriting file" >>./savingOutput.txt

# Redirecting Input
# > Note <EOF> tells the shell that you are going to
# enter a multiline string until the "tag" EOF
wc -w <2_Variables.sh
cat <<EOF
Hello
World
this
is
writing
in
multiple
line
EOF
