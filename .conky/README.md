Conky configs & scripts
=======================

Notes for my conky configs and scripts...

To use simply extract the .conky folder to your home directory and add ~/.conky/runConky.sh to your startup applications


conkyMain

Requires curl to get the external IP address.


conkyUpdates

Requires the apt-show-versions package to be installed.
It also needs your package list to be periodically updated, I have an entry for 'apt-get update' in roots crontab.


conkyInfrastructure

The getPortStatus.sh script has nmap as a dependency.
Usage is getPortStatus.sh <IP-ADDR> <PORT>
If you specify 0 as the port the script will perform a simple ping test instead of an nmap scan.
