#!/bin/bash

# dmenu2 power menu 
#

OPT=$(echo -e "lock\nsuspend\npoweroff\nreboot" | dmenu -f -h 28 -fn "Ubuntu Mono-12" -x 430 -y 370 -w 420 -nb black -nf white -sb white -sf black )

case $OPT in
	lock) slock                       ;;
	suspend) sudo systemctl suspend   ;;
	poweroff) sudo systemctl poweroff ;;
	reboot) sudo systemctl reboot     ;;
	*) ;;
esac
