#!/bin/sh

if [ "$SENDER" = "volume_change" ]; then
	VOLUME=$INFO

	case ${VOLUME} in
	100) ICON="" ;;
	[5-9]*) ICON="" ;;
	[1-9]*) ICON="" ;;
	0) ICON="󰖁" ;;
	*) ICON="" ;;
	esac

	sketchybar -m \
		--set "$NAME" icon=$ICON \
		--set "$NAME" label="$VOLUME%"

fi
