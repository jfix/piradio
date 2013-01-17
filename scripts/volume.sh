#!/bin/bash

# script increments or decrements
# volume of mpc by a definable 
# value, 5 by default.

# I hope to call this via the GPIO
# of the raspberry pi ...

# jfix 28/12/2012

# up or down
VAL=$1

# increments
INCR=5

if [ -z "$VAL" ]; then
	echo "usage: $0 [up|down]"
fi

if [[ "$VAL" == "up" ]]; then
	mpc -q volume +$INCR
elif [[ "$VAL" == "down" ]]; then
	mpc -q volume -$INCR

# ignore any other values
#else 
#	echo unknown value $VAL
fi

