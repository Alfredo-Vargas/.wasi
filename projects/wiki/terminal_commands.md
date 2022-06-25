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

## AWK: Commands


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


