#!/bin/bash

# script expects a directory of m3u and pls files
# it then creates a new playlist saves it in the
# /var/lib/mpd/playlists as "radio" playlist
# all existing playlists are deleted before
# jfix 28/12/2012

BASEDIR=/home/pi/radio
PLSDIR=$BASEDIR/$1
STRSCR=$BASEDIR/streams/out.sh
SCRDIR=$BASEDIR/scripts

mpc -q clear
mpc -q rm radio

echo "#!/bin/bash\n" > $STRSCR

if [ -z "$1" ]; then
	echo usage: $0 playlist-directory
	exit
fi

for file in $( ls $PLSDIR ); do
	echo $file
	bash $SCRDIR/pls-handler.sh $PLSDIR/$file >> $STRSCR
done

chmod 755 $STRSCR
bash $STRSCR
mpc save radio
