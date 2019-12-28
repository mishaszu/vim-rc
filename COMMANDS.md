

## Navigation

### Quick move cursor
#### H
Move cursor to ﬁrst (highest) line in current window.
#### L
Move cursor to the lowest line in current window.
#### M
Move cursor to the middle of the current window.

### Open file on line 2
vim +2 file.txt

### read file operations
Insert the ﬁle ﬁle.txt below the cursor in current buffer.
```
:r file.txt
```
Insert the ﬁle ﬁle.txt before the ﬁrst line.
```
:0r file.txt
```
Insert lines 2 to 8 from ﬁle ﬁle.txt below the cursor.
```
:r!sed -n 2,8p file.txt
```
Insert a directory listing below the cursor
```
:r !ls
```
