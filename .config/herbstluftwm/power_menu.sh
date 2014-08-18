#!/bin/bash

# dmenu2 power menu 
#

OPT=$(echo -e "lock\nsuspend\npoweroff\nreboot" | dmenu -f -h 28 -fn "Ubuntu Mono-12" -x 435 -y 370 -w 410 -nb black -nf white -sb white -sf black )

case $OPT in
    lock) slock ;;
	suspend) slock & sudo systemctl suspend ;;
	poweroff) sudo systemctl poweroff ;;
	reboot) sudo systemctl reboot ;;
	*) ;;
esac
