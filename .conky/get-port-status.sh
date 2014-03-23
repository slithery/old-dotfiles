#!/bin/bash

SCRIPT_NAME="get-port-status.sh"
SCRIPT_DESCRIPTION="A script to check the port status of a host"
SCRIPT_VERSION="0.1"
SCRIPT_AUTHOR="Slithery"

# Script usage
#

usage () { cat <<-USAGETXT

	$SCRIPT_NAME
	v$SCRIPT_VERSION by $SCRIPT_AUTHOR
	
	$SCRIPT_DESCRIPTION
	
	  USAGE:  $SCRIPT_NAME [OPTIONS] host [port]
	
	  OPTIONS:  -h     Display this help.
	            -V     Show version.

        If port isn't specified a simple ping test will be carried out instead.

USAGETXT
}


# Options
#

while getopts :hV flag
	do
    case "$flag" in
    (h) usage; exit 0;;
    (V) echo "$SCRIPT_VERSION"; exit 0;;
#   (e) EXAMPLE_OPTION_SWITCH=1;;			# Add e to getopts string.
#   (f) EXAMPLE_OPTION_VARIABLE="$OPTARG";;		# Add f: to getopts string.
    (*) echo "Invalid option, use -h for help."; exit 1;;
    esac
	done

shift $(($OPTIND - 1))


# Check for argument
#

if [ -n "$1" ]
then
  VAR1=$1
else echo "Hostname not specified, use -h for help."; exit 1
fi


# Main script.
#

if [ ! -n "$2" ]
  then ping -c 1 -t 10 $1 > /dev/null 2> /dev/null
else
  nmap -p $2 $1 | grep open > /dev/null
fi

if [ $? -eq 0 ]
  then echo '${color white}Up  ${color black}Down${color}'
else
  echo '${color black}Up  ${font Ubuntu:style=Bold:size=8}${color red}Down${color}${font}'
fi

exit 0

