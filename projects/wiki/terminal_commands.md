# SIGNALS TO TERMINAL
- `C-c` : sends a stop signal
- `C-z` : sends to background, resume with fg
- `C-s` : suspends terminal 
- `C-q` : resumes suspended terminal 
- `C-d` : sends end of file signal
- Example
```bash
while true; do echo hello; sllep 1' dome
C-s
C-q
```

## TEE: read from  stdin and write to stdout and files
- `echo "yo" | tee path/to/file`

## AWK: Aho, Weinberger, and Kernighan Command
- Program that has the following structures, by default the separator is the space:
```bash
awk 'program' <file1> <file2> ...
awk -f <program-file> <file1> <file2> ...
```
- `awk '{print $n}' <file1>` : prints the n-field (column)
- `awk '{print $NF}' <file1>` : prints the N-field (column), which is the last one
- `awk -F ":" '{print $1}' /etc/passwd` : will print usernames
- `awk '{print $1\t$2+$3}' /etc/passwd` : will print columns 1 and 2 plus 3 tab separated
- `awk 'BEGIN{FS=":"; OFS="-"} {print $1,$6,$7}' <file>` : field separated is `:` and output has `-` as field separated
- `awk '$1 ~ /regex/ {print $0}' <file>` : print only the lines that match the declared regex
- `awk '{print substr($0, 4)}' <file>` : to ignore the characters from 0 until 4
- Print processes which uses `/bin/bash` as the last field on the list
```bash
ps -ef | awk '{ if($NF == "/bin/bash") print $0}'
```
- Print the square root of the first 10 numbers:
```bash
awk 'BEGIN { for(i=1; i<=10; i++) print "The square root of", i, "is", i*i;}'
```

## SED: Stream Editor
- Has mainly the following structure:
```bash
sed "<sed_command>" <file>
<output_on_stdout>
```
- `sed` can use as separators: `/`, `|` or `#`
- `sed /line_pattern/s/find/replace/ <file>` : search for pattern and then performs substitution
- `sed -i "s/find/replace/g <file>"` : the `g` stands for global applicability and the flag `-i` means to write to the file given.
- `sed "s/find/replace/g; /pattern/ d" <file>` : after substitution deletes lines that match the pattern.-
- `sed -e s/find1/replace1/g -e s/find2/replace2/g` : the flag `-e` is required whenever multiple substitutions are placed.
- `sed -n '/pattern/p` : print lines that contain the pattern.

- Remove extra spaces at the end of a line from a file:
```bash
sed -i 's/ *$//' <file>
```
- Remove extra tabs at the end of a line from a file:
```bash
sed -i 's/[[:space:]]*$//' <file>
```
- Remove empty lines:
```bash
sed -i '/^$/d' <file>
```
- Change lower case to upper case (change U to L and [a-z] to [A-Z] for the contrary):
```bash
sed -i 's/[a-z]/\U&/g' <file>
```
- Print the first eleven lines:
```bash
sed 11q <file>
```

# Bash Shell Scripts `Inliners`

## Substitute the names of files following a pattern
```console
for f in *.jpg; do mv "$f" "$(echo "$f" | sed s/IMG/VACATION/)"; done
```

## cat
Concatenates files and sends it to `stdout`
```console
cat file1 file2
tac file1 file2
```
tac does the same as cat but reverse the lines of the file first
some flags: -T for tabs and -n for line number

## tee
Gets `stdin` and puts it in `stdout` or files
```console
echo "Hi" | tee file
```
with flag -a appends instead of whole substitution


