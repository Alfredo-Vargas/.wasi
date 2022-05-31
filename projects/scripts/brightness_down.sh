#!/bin/sh

STEP=2
BASE=10
# grep -i : non case sensitive
# cut -f #  or cut -f# : get field number
# cut -d ' ' # : use as delimeter ' '

C_DISPLAY=`xrandr --verbose | grep -i primary | cut -f 1 -d ' '`
C_BRIGHTNESS=`xrandr --verbose | grep -i brightness | cut -f 2 -d ' '`
SCALED_BRIGHTNESS=$(awk '{print $1*$2}' <<<"${C_BRIGHTNESS} ${BASE}")

if [ $SCALED_BRIGHTNESS -eq 0 ]
then
  xsetroot -name "Minimum value reached"
  sleep 3
  xsetroot -name "ᒡ◯ᵔ◯ᒢ"
else
  SCALED_BRIGHTNESS=$(($SCALED_BRIGHTNESS-$STEP))
  FINAL_VALUE=`echo "scale=1; $SCALED_BRIGHTNESS/10" | bc`
  xrandr --output $C_DISPLAY --brightness $FINAL_VALUE
fi

