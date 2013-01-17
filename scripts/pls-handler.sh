#! /bin/bash

# takes a playlist filename (m3u or pls)
# and extracts the first url it finds
# and finally creates a line starting
# mpc add [media url]

IN=$1
EXT=${IN#*.}

if [ -z "$1" ]; then
	echo usage: $0 playlist
	exit
fi

if [[ "$EXT" == "pls" ]]; then
	OUT=`grep -m 1 '^File[0-9]*' "$IN" | sed -e 's/^File[0-9]*=//'`
elif [[ "$EXT" == "m3u" ]]; then
	OUT=`cat "$IN" | sed -e '/^#/D'`
else
	echo unknown playlist type: $1
	exit
fi
echo "mpc add $OUT"
