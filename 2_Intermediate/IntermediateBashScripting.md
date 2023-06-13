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


exit
ssh bandit8@bandit.labs.overthewire.org -p 2220
```

### Level 8 >> Level 9

```bash
# Using [sort] and [uniq]
cat data.txt | sort | uniq -u


exit
ssh bandit9@bandit.labs.overthewire.org -p 2220
```

### Level 9 >> Level 10

```bash
# Using [strings] we can display the human-readable strings
# and using while and awk to print the password only
strings data.txt | grep "===" | while read line; do echo "$line"; done | awk 'END{print}' | awk 'NF{print $NF}'

exit
ssh bandit10@bandit.labs.overthewire.org -p 2220
```

### Level 10 >> Level 11

```bash
# Yoy should know the [base64] decode/encode
# To encode: echo "example" | base64
# To decode: echo "example" | base64 | base64 -d
cat data.txt | base64 -d

# or only the password without text(not necessary)
# using tr to translate characters or replace
cat data.txt | base64 -d | tr ' ' '\n' | awk END{print}

exit
ssh bandit11@bandit.labs.overthewire.org -p 2220
```

### Level 11 >> Level 12

```bash
# This level have a hard difficult because you need to know
# ROT13, but basically is a simple letteeer substitution that replaces letter with
# the 13th letter after it in the latin alphabet.

# so this is the solution using [tr]
# reading the output of data.txt we can see that the first charater
# is <G> and if we count to 13th position in the latin alphabet
# we can set the substitution in this case <t> is the 13th letter

# abcdefghijklmnopqrstuvwxyz
cat data.txt | tr '[G-ZA-Fg-za-f]' '[T-ZA-St-za-s]' | awk 'NF{print $NF}'

exit
ssh bandit12@bandit.labs.overthewire.org -p 2220
```

### Level 12 >> Level 13

```bash
# In this level we going to use [xxd] command
# and you should know the what is Hex dump
# Basically is a hexadecimal view of computer data.
# also you need know what is hexadecimal. but basically each byte
# (8 bits) is represented as two-digit hexadecimal number.

# Step 1
# Copy the content from data.txt
cat data.txt # copy the content and paste in a new document into your own computer

# Step 2
# Using [xxd] command to rever hexadecimal content and sending output to a new file
xxd -r data.txt > data

# Step 3
# validate the file type using [file]
file data

# Step 4
# changing the file type based on the output from the previous command
mv data data.gzip

# Step 5
# We have many ways to uncompress the file, using [tar], [bzip2], [gunzip]
# but we hava a universal tool [7z] I recommend you learn how to use it.
# You need install 7-zip based on your distribution or operating system.
7z l data.gzip # if you want display the documents into compress file
7z x data.gzip # to uncompress

# Step 6
# If you can see, the file was compressed multiple times.
# So we do not uncompres many times, we can have a script to uncompress the file.
rm data2.bin data.txt # Not necessary at the moment
touch decompressor.sh
# the command [!$] is used to get the last parameter (in this case <decompresor.sh>)
chmod +x !$
# renaming gzip file
mv data.gzip content.gzip

# Step 7
# make scripting (you can see the example into level12_to_level13 directory)
# and execute
./decompressor.sh


exit
ssh bandit13@bandit.labs.overthewire.org -p 2220
```

### Level 13 >> Level 14

```bash
# In this level you need to have the Knowledge base in
# === SSH/OpenSSH/Keys ===
# Public Key authentication is more secure than password authentication.
# With public key authentication the authenticating entity has a public key
# and a private key. Each key is a large number with special mathematical properties.
# The private key os kept on the computer uyou log in from, while the public key
# is stored on the .ss/authorized_key file on all the computers you want to log in to.
# > For more details here 👉 <https://help.ubuntu.com/community/SSH/OpenSSH/Keys>

# Steps for Knowledge base
# In our computer we can see the ssh config into </etc/ssh/sshd_config>
# We edit the file with sudo, and uncomment the line <PermitRootLogin yes>
# and start the service <ssh>
sudo nvim /etc/ssh/sshd_config

# And if is necessary you can force publuic key authentication adding
# the next lines to </etc/ssh/sshd_config>
PasswordAuthentication no
AuthenticationMethods publickey

# At the moment <sshd.service> is the service in Arch Linux
# You need to know what is the SSH service based on your
# Operating system or Linux distro
sudo systemctl start sshd.service
sudo systemctl status sshd.service

# Generating ssh key in your user or root user
ssh-keygen
ls ~/.ssh/

# Copy and renaming public key
# To use public key to connection
cp id_rsa.pub authorized_keys

# other way using [ssh-copy-id]
ssh-copy-id -i id_rsa USER@locahost

# Try to connect by ssh in or own computer
# and validate the connections
ssh USER@localhost
lsof -i:22

# other way if you already [ssh-copy-id]
ssh -i id_rsa USER@localhost

# For the exercise
cat sshkey.private
ssh -i sshkey.private bandit14@localhost -p 2220

# Now connected in bandit14
cat /etc/bandit_pass/bandit14

exit
ssh bandit14@bandit.labs.overthewire.org -p 2220
```

### Level 14 >> Level 15

```bash
# Note > Tho understand this level we should know about
# - How the internet works
# - IP Address
# - Localhost
# - Ports
# - Port (computer networking)

# In this level we can try tri validate
# if the port 30000 is open with this
echo '' > /dev/tcp/127.0.0.1/30000
echo $?

# Or we try to be funny
bash -c "echo '' > /dev/tcp/127.0.0.1/30000" 2>/dev/null && echo "[*] The port is open" || echo "[*] The port is closed"

# Now we can access to the port using different commands like
# [nc]
echo "fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq" | nc localhost 30000

# [telnet]
telnet localhost 30000

# Now connected in bandit15
exit
ssh bandit15@bandit.labs.overthewire.org -p 2220
```

### Level 15 >> Level 16

```bash
# Note > Tho understand this level we should know about
# - Secure Socket Layer / Transport Layer Security
# - OpenSS: Cookbook - Testing with OpenSSL

# using [openssl ]command with [s_client] like this
openssl s_client -connect 127.0.0.1:30001

# Now connected in bandit16
exit
ssh bandit16@bandit.labs.overthewire.org -p 2220
```

### Level 16 >> Level 17

```bash
# Note > Tho understand this level we should know about
# [nmap]

# We can scan the ports using this
nmap --open T5 -v -n  -p31000-32000 127.0.0.1

# Now we can try and validate with the password
# what is the correct port
openssl s_client -connect 127.0.0.1:31790

# we can copy the rsa private key\
# in own computer and use it like level 14
nano sshkey17.private
chmod 600 sshkey17.private # Permissions normally used in rsa private keys
ssh -i sshkey17.private bandit17@bandit.labs.overthewire.org -p 2220
```

### Level 17 >> Level 18

```bash
# We only need to use [diff] command
ls
diff passwords.old passwords.new

# Now connected in bandit18
exit
ssh bandit18@bandit.labs.overthewire.org -p 2220
```

### Level 18 >> Level 19

```bash
# we can connect to bandit18 but the .bashrc file has modified to log us
# when we log in.

# But we can execute a bash to dont log out
ssh bandit18@bandit.labs.overthewire.org -p 2220 bash

# Now you cant see the CLI but we can test with a [ls] or [whoami]
ls
whoami

# And finally we can copy the password
cat readme

# or
cat /etc/bandit_pass/bandit18

# Now connected in bandit19
exit
ssh bandit19@bandit.labs.overthewire.org -p 2220
```

### Level 19 >> Level 20

```bash
# In this level you may knwow about <setuid>

# we can execute the binary file ./bandit20-do
# using [bash -p] to use <uid>
./bandit20-do bash -p
cat /etc/bandit_pass/bandit20

# Now connected in bandit20
exit
ssh bandit20@bandit.labs.overthewire.org -p 2220
```

### Level 20 >> Level 21

```bash
# We need to know about knlowedge base about Internet
# and how it works, and also we need to use [nc]
# and also I recommend you use tmux or somethin like this
# to make 2 connections to bandit 21

# Step 1
# use [nc] command to open a conection in a specific port
# and listening at port
nc -nlvp 5757

# Step 2
# in the other bandit20 connection we going to execute the
# binary file
./suconnect 5757

# Step 3
# go back to other connection where we put the command
# [nc -nlvp 5757]
# and we going to paste the bandit20 password and finally
# the bandit21 password should be displayed correctly


# Now connected in bandit21
exit
ssh bandit21@bandit.labs.overthewire.org -p 2220
```

### Level 21 >> Level 22

```bash
# For this level I recommend you investigate about
# [cron]

# First we should analyze the files into /etc/cron.d
ls -l /etc/cron.d
cat /etc/cron.d/cronjob_bandit22

# And we can see the content of conjob_bandit22
# that a script is executed we can see the content of this script
cat /usr/bin/cronjob_bandit22.sh

# Based on the previous display we can see that the password
# of bandit22 is saved on a temp file so we can display the content from this
# temporal file

# Now connected in bandit22
exit
ssh bandit22@bandit.labs.overthewire.org -p 2220
```

### Level 22 >> Level 23

```bash
# Like the previous leven we need analyze de /etc/cron.d/ jobs
ls /etc/cron.d/
cat /etc/cron.d/cronjob_bandit23
cat /usr/bin/cronjob_bandit23.sh

# Based on the script we can find out the tmp file where the password it saved
echo I am user bandit23 | md5sum | cut -d ' ' -f 1

# or better
echo I am user bandit23 | md5sum | awk '{print $1}'

# and we can use the output of previous command
cat /tmp/8ca319486bfbbc3663ea0fbe81326349

# Now connected in bandit23
exit
ssh bandit23@bandit.labs.overthewire.org -p 2220
```

### Level 23 >> Level 24

```bash
# Like the previous leven we need analyze de /etc/cron.d/ jobs
ls /etc/cron.d/
cat /etc/cron.d/cronjob_bandit24
cat /usr/bin/cronjob_bandit24.sh

# apparently the script execute all into [/var/spool/bandit24]
# so we can make an script to save the password in a temporal file
mkdir /tmp/mrp4sten
cd /tmp/mrp4sten
touch script.sh
chmod +x script.sh
vim script.sh

# the content from the script should be
#!/bin/bash
cat /etc/bandit_pass/bandit24 > /tmp/mrp4sten/pass.txt

# make file password
touch password
chmod o+w -R /tmp/mrp4sten

# or
chmod o+w /tmp/mrp4sten/password

# copy into /var/spool/bandit24/foo
cp script.sh /var/spool/bandit24/foo/

# 1 minute after do
cat password

# Now connected in bandit24
exit
ssh bandit24@bandit.labs.overthewire.org -p 2220
```

### Level 24 >> Level 25

```bash
mkdit /tmp/mrp4sten
cd /tmp/mrp4sten
touch script.sh
chmod +x script.sh
vim script.sh

# content from the script
#!/bin/bash
for i in {0000..9999}; do
 echo "VAfGXJ1PBSsPSnvsjI8p759leLZ9GGar $i"
done

./script.sh | nc localhost 30002 > result.txt
sort result.txt | grep -v -E "Wrong|Please"

```

### Level 25 >> Level 26

```bash
# First we try to connect but the bandit16 session is closed
mkdir /tmp/mrp4sten
cd /tmp/mrp4sten
cp ~/bandit26.sshkey .
ssh -i bandit26.sshkey bandit26@localhost -p 2220

# validating what is the shell for bandit25
cat /etc/passwd | grep bandit25

# validating what is the shell for bandit26
cat /etc/passwd | grep bandit26

# the output of the previous command display a file
cat /usr/bin/showtext

# You should know about the command [more]
# and also now if we using tmux and we make the terminal small
# we can exploit the [more] command
# We can click on <v>
# after click <shift> + <:>
# and write > set shell=/bin/bash
# after click <shift> + <:>
# and write > shell
# now we have a shell with bandit16
```

### Level 26 >> Level 27

```bash
# This is so easy
./bandit27-do
./bandit27-do whoami
./bandit27-do bash -p
whoami
cat /etc/bandit_pass/bandit27
```

### Level 27 >> Level 28

```bash
# You only need to know git
mkdir /tmp/mrp4sten
cd /tmp/mrp4sten
git clone ssh://bandit27-git@localhost:2220/home/bandit27-git/repo
# paste the bandit27 password
cat repo/README
```

### Level 28 >> Level 29

```bash
# You only need to know git
mkdir /tmp/mrp4sten
cd /tmp/mrp4sten
git clone ssh://bandit28-git@localhost:2220/home/bandit28-git/repo
cd repo
git log -p
# review it the log and use the password
```

### Level 29 >> Level 30

```bash
# You only need to know git
mktemp -d
cd /tmp/example
git clone ssh://bandit29-git@localhost:2220/home/bandit29-git/repo
cd repo
git branch -r
git checkout origin/dev
git branch
cat README.md
```
