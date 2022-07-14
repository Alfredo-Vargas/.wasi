# Bash Scripting Notes

## Exit Code Number
- `1` : Catchall for general errors
- `2` : Misuse of shell `builtins` according to Bash documentatio 
- `126` : Command invoked cannot execute
- `127` : Command not found
- `128` : Invalid argument to exit
- `128+n` : Fatal error signal "n"
- `130` : Script terminated by Control-C
- `255*` : Exit status out of range

## Some Bash Commands
- `bash -x` : Diagnose of your `.bashrc`

## Bash Fundamentals
- No spaces when declaring variables!
- `$(command)` : prints the output of the **command** given to the current position
- `command1; command2; ...` : several commands in a single line are separated by a semicolon
- `Globs` allows to create list of files. Globs can be used in python scripts by importing in Python the `Glob` module
- `$?` returns exits status of $0$ if no error occurred 

### IF conditional
- In a regular script:
```bash
if grep "127.0.0.1" /etc/hosts; then
  echo "Everything ok"
else
  echo "ERROR! 127.0.0.1 is not in /etc/hosts"
fi
```
- Check if a string is empty: 
```bash
if test -n "$PATH"; then echo "Your path is not empty"; fi`
```
```bash
if [ -n "$PATH" ]; then echo "Your path is not empty"; fi
```

### While loop
- Incremental while
```bash
n=1
while [ $n -le 5 ]; do
  echo "Iteration number $n"
  ((n+=1))
done
```
- While file exits or not
```bash
while ! <filename>
do
  actions
done
```
- While command execution is successful or fails
```bash
while ! cat <filename> 2> /dev/null
do
  actions
done
```

### For loop
```bash
for logfile in /var/log/*log; do
  echo "Processing: $logfile"
  cut =d' ' -f5- $logfile | sort | uniq -c | sort -nr | head -5
done
```

## Special Characters
### Comment Character (Octothorp)
- Comment char `#` requires a space to be read properly. See example with no space and space:
```bash
echo "A comment will follow." # Comment here.
#                            ^ Note whitespace before #
```
- Comments may be embedded within a pipe:
```bash
initial=( `cat "$startfile" | sed -e '/#/d' | tr -d '\n' |\
# Delete lines containing '#' comment character.
           sed -e 's/\./\. /g' -e 's/_/_ /g'` )
# Excerpted from life.sh script
```
- Base conversion
```bash
echo $(( 2#101011 ))
```

### Command separator (Semicolon)
- Require a white space before inserting the next command
```bash
echo hello; echo there

if [ -x "$filename" ]; then    #  Note the space after the semicolon.
#+                   ^^
  echo "File $filename exists."; cp $filename $filename.bak
else   #                       ^^
  echo "File $filename not found."; touch $filename
fi; echo "File test complete."
```
- Terminator in case option (switch-like). Substitute `;` for `;&` for Bash version of $4+$
```bash
case "$variable" in
  abc) echo "\$variable = abc" ;;
  xyz) echo "\$variable = xyz" ;;
esac
```

### Dot Command (period)
- `. .bashrc` : equivalent to source
- Denotes current working directory, prefixes hidden files, refers to parent directory if used twice

### Quoting
- `("...")` : partial quoting or weak quoting, does not interfere with variable substitution
- `('...')` : full quoting or strong quoting, the variable names are used literally

### Comma Operator (comma)
- Links together a series of arithmetic operations, but only last one is returned
```bash
let "t2 = ((a = 9, 15 / 3))"
# Set "a = 9" and "t2 = 15 / 3"
```
- Also used to concatenate strings
```bash
for file in /{,usr/}bin/*calc
#             ^    Find all executable files ending in "calc"
#+                 in /bin and /usr/bin directories.
do
        if [ -x "$file" ]
        then
          echo $file
        fi
done
```

# References
1. [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/index.html)
