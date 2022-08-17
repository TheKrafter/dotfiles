#!/usr/bin/env bash
# Take screenshots via ImageMagick. Intended for use with window managers.
# Run Without any args for usage
echo -n "Taking Screenshot "
screenshotdir=$HOME/Pictures/Screenshots
screenshot="$screenshotdir/Screenshot_$(date +'%Y-%m-%d_%T').png"
mkdir -p $screenshotdir
exit=5
if [ $2 >= 0 ];
then
	delay=$2
else
	delay=0
fi
if [ "$1" == "screen" ];
then
	sleep $delay"s"
	echo "of Entire Screen"
	import -window root $screenshot && exit=0
elif [ "$1" == "select" ];
then
	sleep $delay"s"
	echo "of Selection"
	import $screenshot && exit=0
else
	echo "! Invalid Option."
	echo "Usage: ./screenshot.sh [select|screen]"
	echo "    select  Screenshot selection"
	echo "    screen  Screenshot entire screen"
	exit=1
fi
if [ $exit == 0 ]
then
	xclip -i < $screenshot
	eog $screenshot
	echo "Success!"
fi
exit $exit
