################
# Bash aliases #
################

# cd aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# media download aliases
alias ipl='get_iplayer && clear && get_iplayer --nocopyright'
alias gipl='get_iplayer --nocopyright --output=/home/rob/videos --tvmode=flashhd,flashvhigh,flashhigh,flashstd,flashnormal --get'
alias yt='youtube-dl --max-quality url'
alias mps='/home/rob/mps/mps'

# pacman aliases
alias pacu='sudo pacman -Syu'
alias paci='sudo pacman -S'
alias pacr='sudo pacman -Rs'
alias pacs='pacman -Ss'

# systemd aliases
alias sc='systemctl'
alias ssc='sudo systemctl'
alias scu='systemctl --user'
alias jc='sudo journalctl'
alias journ='sudo journalctl -b -f'
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
alias sv='sudoedit'

# sudo alias fix
alias sudo='sudo '

# git aliases
alias gita='git add '
alias gitc='git commit -a'
alias gitp='git push'
alias gitl='git log --graph --oneline --decorate'
alias gits='git status'


# misc aliases
alias du='du -h --max-depth=1 | sort -hr'
alias lsblk='lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL,UUID'
alias rconk='pkill -9 conky && ~/.config/conky/runconky.sh > /dev/null & disown'
alias hc='herbstclient'
alias xxx='mpv --shuffle --loop=inf ~/videos/.new/*'
alias rt='urxvt -e tmux attach -t rt'
alias black='ssh -p 22222 black.slithery.it'
alias strip="awk '!/^ *#/ && NF'"
