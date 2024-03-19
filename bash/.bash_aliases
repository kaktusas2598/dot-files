# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -hF --color=auto' #Classify files
    alias l.='ls -d .* --color=auto'
    alias ll='ls -l --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias la='ls -a'
# NOTE: Had to remove -C flag as it is not directly compatible with exa
# Also had to change -A flag above to -a
alias l='ls -F' # C
if command -v exa &> /dev/null
then
    alias ls='exa --icons'
fi

alias ..='cd ..'
alias mkdir='mkdir -p'
alias e='exit'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

#Hardware and drivers info
alias hardware='lspci -v | less'
alias openPorts="sudo lsof -i -P -n | grep LISTEN"
alias myIp='curl icanhazip.com'
alias weather='curl wttr.in?format=3'
alias cmodules='cmake --help-module-list'
alias dirToUnix='find . -type f -exec dos2unix {} \;'

# On Ubuntu/Debian systems bat is called "batcat", remap it here
if command -v batcat &> /dev/null
then
    alias bat='batcat'
fi
# Same for fd, it is fdfind on ubuntu
if command -v fdfind &> /dev/null
then
    alias fd='fdfind'
fi

#For lazy devs like me
alias c='clear'
alias g='git'
alias gut='git'
alias got='git'
alias gs='git status'
alias v='vim'
alias n='nvim'
alias r='ranger'
alias nvimdiff='nvim -d'
alias reload='source ~/.bashrc'

# Pipe output to clippy to copy it to the clipboard
alias clippy='xclip -sel c -rmlastnl'

#Same as CMD+K on MAC, clears whole scrollable buffer, not just visible part
#alias clear="clear && printf '\e[3J'"

#For linux OS, alias xdg-open as open to make it work just like in OS X
#if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    #alias open="xdg-open"
#fi

###############################################################################
#             PI Datametrics Docker aliases                                   #
alias docker-compose-reload-no-cache='docker-compose down; docker-compose build --no-cache; docker-compose up -d'
alias docker-stop-all='docker stop $(docker ps -a -q)'
alias docker-rm-all='docker rm $(docker ps -a -q)'
alias docker-rmi-all='docker rmi $(docker images -q)'
alias docker-compose-reload='docker-compose down; docker-compose build --build-arg UID=$(id -u) --build-arg GID=$(id -g); docker-compose up -d'
alias docker-compose-reload-no-cache='docker-compose down; docker-compose build --no-cache --build-arg UID=$(id -u) --build-arg GID=$(id -g); docker-compose up -d'
alias docker-spawn='docker exec -it cli bash'
alias docker-spawn='docker exec -it webapp bash'
###############################################################################
#            Work Laptop Specific Aliases                                     #
# Run when plugging in 2nd monitor, output name might change though!
alias monitors='xrandr --output DP-3 --mode 2560x1440 --right-of eDP-1'
# Will resursively count the lines in all cpp and hpp files in src directory
alias vcode='find src/ -name "*.cpp" -o -name "*.hpp" | xargs cat | wc -l'

function getcw() {
  echo aws logs get-log-events --log-group-name "$1" --log-stream-name $(aws logs describe-log-streams --log-group-name "$1" --max-items 1 --descending --order-by LastEventTime | grep logStreamName | cut -d':' -f2 | sed -e 's/,//' -e 's/\"/'\''/g') | sh -
}
