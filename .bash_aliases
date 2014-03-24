##############################
# Bash aliases and functions #
##############################

# cd aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# get_iplayer aliases
alias ipl='get_iplayer && clear && get_iplayer --nocopyright'
alias gipl='get_iplayer --nocopyright --output=/home/rob/Videos --tvmode=flashhd,flashvhigh,flashhigh,flashstd,flashnormal --get'

# pacman aliases
alias pacu='sudo pacman -Syyu'
alias paci='sudo pacman -S '
alias pacr='sudo pacman -Rs '
alias pacs='pacman -Ss '

# systemd power aliases
alias shutdown='systemctl poweroff'
alias reboot='systemctl reboot'
alias suspend='systemctl suspend'

# grep aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pg='ps -Af | grep $1'
alias hist='history | grep'

# ls aliases
alias ls='ls -lh --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

# vi aliases
alias vi='vim'
alias sv='sudo vim'

# sudo alias fix
alias sudo='sudo '

# git aliases
alias gita='git add '
alias gitc='git commit -a'
alias gitp='git push'
alias gitl='git log --graph --oneline --decorate'
alias gits='git status'


alias du='du -h --max-depth=1 | sort -hr'
alias lsblk='lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL,UUID'
alias rconk='pkill -9 conky && ~/.conky/runConky.sh > /dev/null & disown'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'


# Add an "alert" alias for long running commands.  Use like so: 'sleep 10; alert'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# Functions

extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


fah () {
    systemctl status foldingathome > /dev/null
    if [ $? == 0 ]; then
      echo "Stopping F@H"
      sudo systemctl stop foldingathome
    else
      echo "Starting F@H"
      sudo systemctl start foldingathome
    fi
}

