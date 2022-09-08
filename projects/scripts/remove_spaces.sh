#!/bin/bash

ls | while read file; do mv "$file" "$(echo "$file" | sed -e 's/ /_/g')" ; done;
