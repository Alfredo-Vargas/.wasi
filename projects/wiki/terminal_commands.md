## sed command
- Has mainly the following syntax:
```bash
sed "<sed_command>" <file>
```
- With `g` replaces take effect every single match. Without `g` only ones per line.
- With `-i` option `sed` overwrites original file with the given std output.
- `sed "s/to_be_replaced/replacement/g <file>"`
- `sed "s/to_be_replaced/replacement/g; /pattern/ d" <file>` : after substitution deletes lines that match the pattern.

## awk Commands


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


