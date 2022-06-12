#! /bin/bash

# first check for connectivity
# -q silent mode, --spider don't get page just check availability, $? is the return shell code where 0 means it is OK
wget -q --spider http://google.com
message=$(date '+%Y-%m-%d %H:%M:%S')

if [ $? -eq 0 ]; then
  git -C $HOME/.wasi add .
  git -C $HOME/.wasi commit -m "$message "
  git -C $HOME/.wasi push
fi

