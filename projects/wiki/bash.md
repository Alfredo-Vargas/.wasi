# Bash Shell Scripts `Inliners`


## Substitute the names of files following a pattern
```console
for f in *.jpg; do mv "$f" "$(echo "$f" | sed s/IMG/VACATION/)"; done
```
