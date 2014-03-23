#!/bin/sh
sleep 15
/usr/bin/conky -d -c ~/.conky/conkyMain &
sleep 5
/usr/bin/conky -d -c ~/.conky/conkyInfrastructure &
sleep 5
/usr/bin/conky -d -c ~/.conky/conkyUpdates &
sleep 5
/usr/bin/conky -d -c ~/.conky/conkyMusic &
