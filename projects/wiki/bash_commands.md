# cat
Concatenates files and sends it to `stdout`
```console
cat file1 file2
tac file1 file2
```
tac does the same as cat but reverse the lines of the file first
some flags: -T for tabs and -n for line number

# tee
Gets `stdin` and puts it in `stdout` or files
```console
echo "Hi" | tee file
```
with flag -a appends instead of whole substitution


