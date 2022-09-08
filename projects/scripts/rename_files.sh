#!/bin/bash

# Renames the file names listed in the source file "original_names.txt"
# The renaming requires a prefix and a file extension

names_source="original_names.txt"
prefix="fig"
extension=".jpg"

counter=1
while read -r line; do
	mv "$line" "$prefix$counter$extension"
	counter=$((counter + 1))
done <"$names_source"
