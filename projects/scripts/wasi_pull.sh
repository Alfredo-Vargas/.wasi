#! /bin/bash

# first check for connectivity
# -q silent mode, --spider don't get page just check availability, $? is the return shell code where 0 means it is OK
wget -q --spider http://google.com

if [ $? -eq 0 ]; then
  git -C $HOME/.wasi pull
fi

