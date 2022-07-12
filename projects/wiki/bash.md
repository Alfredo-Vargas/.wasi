# Bash Scripting Notes

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

### For loop
```bash
for logfile in /var/log/*log; do
  echo "Processing: $logfile"
  cut =d' ' -f5- $logfile | sort | uniq -c | sort -nr | head -5
done
```
