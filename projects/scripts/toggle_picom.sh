#!/bin/bash

SERVICE="picom"

if pgrep -x "$SERVICE" > /dev/null
  then
    killall "$SERVICE"
  else
    "$SERVICE" &
fi

