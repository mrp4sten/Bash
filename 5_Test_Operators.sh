#!/bin/bash
# author: mrp4sten

# The follow is the test operators

# === Compound Comparison ===
# - [-a] (Logical AND < && >)
# - [-o] (Logical OR < || >)

# === Integer Comparison ===
# - [-eq] (Equals to)
# - [-ne] (Not Equals)
# - [-gt] [>] (greater than)
# - [-ge] [>==] (greater than or equal to)
# - [-lt] [<] (less than)
# - [-le] [<=] (less than or equal to)

# === String Comparison ===
# - [=][==] (Equal to)
# - [!=] (Is not equal to)
# - [<] (Less than)
# - [>] (Greater than)
# - [-z] (String is null)
# - [-n] (String is not null)

# === File test operators ===
# - [-e] (File Exists)
# - [-f] (Is regular file (not a directory or device file))
# - [-d] (Is a directory)
# - [-h][-L] (Is a Symbolic link)
# - [-b] (Is a block device)
# - [-c] (Is a character device)
# - [-p] (Is a pipe)
# - [-S] (Is a socket)
# - [-s] (Is not zero size)
# - [-t] (File (descriptor) is associated with a terminal device)
# - [-r] (file has read permission)
# - [-w] (file has write permission)
# - [-x] (file has execute permission)
# - [-g] (set-group-id (sgid) flag set on file or directory)
# - [-u] (set-user-id (suid) flag set on file)
# - [-k] (sticky bit set)
# - [-O] (you are owner of file)
# - [-G] (group-id of file same as yours)
# - [-N] (file modified since it was last read)
# - [-nt] (file f1 is newer than f2)
# - [-ot] (file f1 is older than f2)
# - [-ef] (files f1 and f2 are hard links to the same file)
# - [!] ("not" -- reverses the sense of the tests above (returns true if condition absent))

# Some examples
echo $((hello = hello))

numberOne=1
numberTwo=1
echo $((numberOne = numberTwo))
