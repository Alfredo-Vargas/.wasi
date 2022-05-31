#!/bin/bash

input="./srcPhotos.txt"

while IFS= read -r line
do
  wget "$line"
done < "$input"
