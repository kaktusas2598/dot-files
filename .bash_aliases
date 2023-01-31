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

alias la='ls -A'
alias l='ls -CF'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

#Hardware and drivers info
alias hardware='lspci -v | less'
alias openPorts="sudo lsof -i -P -n | grep LISTEN"
#alias most_used='history|awk '{print $2}'|awk 'BEGIN {FS="|"} {print $1}'|sort|uniq -c|sort -r'

#For lazy devs like me
alias c='clear'
alias g='git'
alias gut='git'
alias got='git'
alias v='vim'
alias n='nvim'
alias r='ranger'

alias dirToUnix='find . -type f -exec dos2unix {} \;'
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

