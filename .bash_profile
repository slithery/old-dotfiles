#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

PATH="${PATH}:/opt/android-sdk/tools:/opt/android-sdk/platform-tools"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
