# Bash scripting | Intermediate

In this file we can practice bash scripting intermediate. Using a Platform knowledge like `overthewire`
so I recommend you use this file like first steps and after you can visit <https://overthewire.org/wargames/bandit>
and practice.

## Bandit

### Level 0

```bash
# To connect in a server we can use the command [ssh]
ssh bandit0@bandit.labs.overthewire.org -p 2220

# We can validate our ip using
hostname -I

# or only the hostname
hostname
```

### Level 0 >> Level 1

```bash
# we can see the files using
cat readme

# now we can exit and login again with bandit1 instead bandit0
# using the password from readme
exit
ssh bandit1@bandit.labs.overthewire.org -p 2220
```

### Level 1 >> Level 2

```bash
# In this level the things should be confused because now
# we need locale a file named [-] this is a little problem because
# in bash the character [-] is used like a parameter into the commands
# but we have some ways to show the content from files named [-]
cat ./-
cat /home/bandit1/-
cat /home/bandit1/* # tho show the content from all files
cat $(pwd)/-

# now we have the password to bandit2
exit
ssh bandit2@bandit.labs.overthewire.org -p 2220
```

### Level 2 >> Level 3

```bash
# This level is not hard yet, to get the password in the file
# "spaces in this filename" we should know that in bash
# we can't use spaces into the commands. I recommend you use the
# Key [tab] in you keyboard to autocomplete the files. Or you can do this:
cat "spaces in this filename"
cat spaces\ in\ this\ filename\


# now we have the password to bandit3
exit
ssh bandit3@bandit.labs.overthewire.org -p 2220
```

### Level 3 >> Level 4

```bash
# We need how to use in many ways the command [ls]
cd inhere
ls -a # to show hidden files
ls -a inhere/ # or in once line
find . # or find a files in the path using regex
find . -type f # or find only files

# or display files like a pro
# <%f\t%p\t%u\t%g\t%m\n"> files/tab&path/tab&user/tab&user_owner/tab&groups/tab&mode(permissions code)/next line
# column -t to split columns automatically and auto-align them in tabular format
find . -type f -printf "%f\t%p\t%u\t%g\t%m\n" | column -t

find . -name .hidden | xargs cat

# now we have the password to bandit4
exit
ssh bandit4@bandit.labs.overthewire.org -p 2220
```

### Level 4 >> Level 5

```bash
# We need to know the file that is only human-readable,
# for this we can use the command [file] to display the information
# about the content from each file.

# Note > I recommend you learn about the REGEX(regular expressions)
file inhere/*
cat inhere/-file07 # the file with text content

# other way
find . -name -file* | xargs file
find . -name -file07 | xargs cat

# other pro way
cat $(find . -name -file07)

# now we have the password to bandit5
exit
ssh bandit5@bandit.labs.overthewire.org -p 2220
```

### Level 5 >> Level 6

```bash
# We need know the command find, to this I recommend you use
# the utility [man] or [tldr] to know how to use correctly this command
# so we can do the follow command based on the info in OverTheWire:

# The follow instruction basically find a type file with readable permissions,
# without executable permissions and finally with a size of 1033 bytes using (c) to the end
# to specify correctly the size in bytes.

# Using xargs to can format the output and also print the content from the file found
find . -type f -readable ! -executable -size 1033c | xargs cat | xargs


# now we have the password to bandit5
exit
ssh bandit6@bandit.labs.overthewire.org -p 2220
```

### Level 6 >> Level 7

```bash
# The follow command try to find into path [/]
# with the user bandit7 (the owner)
# with the group bandit6
# with of size from 33 bytes
# Using /dev/null to not print errors (basically without stderr)
# and finally displaying the content
find / -user bandit7 -group bandit6 -size 33c 2>/dev/null | xargs cat

# now we have the password to bandit5
exit
ssh bandit7@bandit.labs.overthewire.org -p 2220
```

### Level 7 >> Level 8

```bash
# Find the word millionth into the file to display the password
grep "millionth" data.txt
awk '/millionth/' data.txt

# To a better display
awk '/millionth/' data.txt | awk '{print $2}'

# now we have the password to bandit5
exit
ssh bandit8@bandit.labs.overthewire.org -p 2220
```

### Level 8 >> Level 9

```bash
# Using [sort] and [uniq]
cat data.txt | sort | uniq -u

# now we have the password to bandit5
exit
ssh bandit9@bandit.labs.overthewire.org -p 2220
```

### Level 9 >> Level 10

```bash
# Using [strings] we can display the human-readable strings
# and using while and awk to print the password only
strings data.txt | grep "===" | while read line; do echo "$line"; done | awk 'END{print}' | awk 'NF{print $NF}'

# now we have the password to bandit5
exit
ssh bandit10@bandit.labs.overthewire.org -p 2220
```
