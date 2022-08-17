#!/usr/bin/env bash
PACTL_VOL=$("pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' ")
if [ $PACTL_VOL > 30 ];
then
	PACTL_VOL_ICON=
elif [ $PACTL_VOL <= 30 ];
then
	PACTL_VOL_ICON=
elif [ $PACTL_VOL <= 0 ];
then
	PACTL_VOL_ICON=
fi
if [ $(pactl get-sink-mute @DEFAULT_SINK) == "Mute: yes" ];
then
	PACTL_VOL_ICON=
fi
echo -e "$PACTL_VOL_ICON $PACTL_VOL%"
