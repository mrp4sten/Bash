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
