# Bash Scripting Notes

## Notes

- Primitive types in bash: Strings, numbers and booleans
- Export function in environment variables are considered bash hacks. Some people considered that are not good practice
- The function export functionality allowed the `Shellshock/Bashdoor` disaster, which affected millions of computers: [shellshock](<https://en.wikipedia.org/wiki/Shellshock_(software_bug)>)
- The bug caused Bash to unintentionally execute commands when the commands are concatenated to the end of **functions definitions** stored in the values of **environment variables**
- Do not abuse the usage of bash function on environment variables
- Do not expect floating point operations in bash. Bash does not support it

## Tips

- You can use the command **wait** and it waits all `bg` jobs. There is no need to specify the `PID` when one needs to wait for all jobs.
- So instead of doing the following:

```bash
for pid in ${pids[*]}; do
  wait $pid
done
```

- Do just

```bash
wait
```

- Use parenthesis for command substitutions instead of backticks. Backticks cannot be nested and are harder to see

```bash
echo "Use better \$(date): $(date)"
echo "Rather than \`date\`: $(date)"
```

- Use the math operator whenever possible

```bash
echo "one plus one is $((1 + 1))"
```

- Use double quotes around your echos to print the newline characters

## When to use what

- `Aliases` only supported by interactive shells
- `Exported function` only supported by bash
- `POSIX script` when we want to share or run from anything
- `Bash script` when more than `POSIX` is required but no enough to compile
- `Node script` when JSON manipulation or web-centric operation are required
- `Python script` when automation, ML, or math-intensive operations are required
- `Go program` when compilation is required
- `Rust program` when compilation without garbage collection is required
- `C program` when finely tuned, low-level compilation is required
- `Assembly code` when ultra low-level compilation is required

- Use functions instead of aliases
- `export -f <function-name>` : to export functions. The export function takes a variable or function and makes it available to other child processes. Anything that is not exported is not available to other subprocesses for many reasons including security
- **export** works for function using the `bash` interpreter and not the `sh` interpreter
- when using export functions on vi or vim, make sure that the environment that the current vi or vim session has as parent a shell which supports export functions, e.g. **bash**

## Functions

- Use functions instead of aliases

```bash
greet() { echo "Hello $1" ; }  # Carefully place the spaces around!
greet junior
```

## Command structure in bash

```bash
command -options arguments
```

## Globing in bash

- Can be enable using the shell option command `shopt`

```bash
shopt -s globstar
shopt -s dotglob
```

## Ranges in bash

- `Data???` : any file beginning with "Data" followed by exactly three characters
- `[abc]*` : any file that begins with either "a", "b" or "c"
- `BACKUP.[0-9][0-9][0-9]` : any file that begins with backup and following exactly three numerals
- `[[:upper:]]*` : any file beginning with an upper case letter
- `[![:digit:]]*` : any file **not** beginning with a numeral
- `*[[:lower:]123]` : any file ending with lowercase letter or the numerals 1, 2 or 3
- Nice directory creation using range

```bash
mkdir {2007..2009}-{01-12}
```

- Options are settings of the command and arguments are input to the command

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

- Using brace expansions
- `for i in {a..z}; do echo $i; done` : inline for loop
- `for i in {01..10}; do echo prefix$i; done` : inline for loop
- `for i in {1..$RANDOM}; do echo $i; done`
- `for site in gmail images; do dig +short $site.google.com; done`
- Iterate over files on a given directory

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

### Freshly learned Commands to record your command actions

- `asciinema` and `script` : to record your current set of commands
- `wall` : to send messages to all users on the system

# Esoteric and dangerous things in bash

- The following command produces two files one in `/tmp/` named `some stupid` and another in the relative path named `filename`. The `f` the `\f` just scapes the `f` producing a regular f

```bash
touch /tmp/some\ stupid \filename
```

- `ls | xxd` to troubleshoot filenames with weird names

# References

1. [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/index.html)
