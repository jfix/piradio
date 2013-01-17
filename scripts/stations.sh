#!/bin/bash

# script changes stations of playlist
# I hope to call this via the GPIO
# of the raspberry pi ...
# jfix 28/12/2012

# next or previous 
VAL=$1

if [ -z "$VAL" ]; then
	echo "usage: $0 [next|prev]"
	exit
fi

PLS=`mpc playlist`
CUR=`mpc current`

# function that retrieves current station number
function get_current_station() {
	I=0
	echo "$PLS" | while read -r station;
	do
		let I=$((I+1)) #$((I+1))
		#echo now looking at "$I" - "$station" and "$CUR"
	
		if [[ $station == "$CUR" ]]; then
			echo $I
			break
		fi	
	done
}

# number of stations in playlist
MAX=`echo "$PLS" | wc -l`
echo There are $MAX stations.
echo Current station is $CUR.
echo =======================
echo "$PLS"
echo =======================

I=$(get_current_station)

if [[ "$VAL" == "next" && "$I" -lt "$MAX" ]]; then
	mpc -q next 
elif [[ "$VAL" == "prev" ]]; then
	mpc -q prev
fi

