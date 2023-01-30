# Use case-insensitive filename globbing
shopt -s nocaseglob

# Enable dot files globbing, wildcard matches hidden files
shopt -s dotglob

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

#change umask to mkae dir sharing easier
umask 0002

#----HISTORY SETTINGS
#Ignore duplicates in history and increase its size
export HISTCONTROL=ignoredups
export HISTSIZE=1000

# append to the history file, don't overwrite it
shopt -s histappend
#----

#Add ~/bin/ dir to PATH so we can execute our own scripts
export PATH=~/bin:"$PATH"

#----ALIASES----

# You may want to put all your additions into a separate file like
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Set local inputrc for stuff like case-insensitive auto completion in bash
export INPUTRC="$HOME/.inputrc"

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
alias n='nvim'
alias r='ranger'
#----

#Get git branch name
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

##Customize shell prompt
function prompt
{
    #Colors for prompt, see ecpape secuences for colors
    local WHITE="\[\033[1;37m\]"
    local GREEN="\[\033[0;32m\]"
    local YELLOW="\[\033[1;33m\]"
    local RED="\[\033[0;31m\]"
    local GRAY="\[\033[0;37m\]"
    local BLUE="\[\033[0;34m\]"

    #Escape codes
    local TIME="\A"
    local USER="\u"
    local HOST="\h"
    local PWD="\W"
    local FULL_PWD="\w"
    export PS1="${RED}${TIME}${WHITE}[${GREEN}${USER}${YELLOW}:${BLUE}${FULL_PWD}${WHITE}]${YELLOW}\$(parse_git_branch) \$ ${GRAY}"
    #export PS1="${RED}\A${WHITE}[${GREEN}\u@\h ${RED}\W${WHITE}]${GREEN}\$ ${GRAY}"
}
prompt
#Greeting

#extract any archive
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1       ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

#colored terminal
#export TERM="screen-256color" #xterm256-color with tmux doesnt work right
#Convert all files in dir from CRLF to LF endings
alias dirToUnix='find . -type f -exec dos2unix {} \;'
#Same as CMD+K on MAC, clears whole scrollable buffer, not just visible part
#alias clear="clear && printf '\e[3J'"

#For linux OS, alias xdg-open as open to make it work just like in OS X
#if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	#alias open="xdg-open"
#fi


#Colored man
#export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
#export LESS_TERMCAP_md=$'\E[01;31m'      # begin bold
#export LESS_TERMCAP_me=$'\E[0m'           # end mode
#export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
#export LESS_TERMCAP_so=$'\E[01;44;33m'   # begin standout-mode - info box
#export LESS_TERMCAP_ue=$'\E[0m'           # end underline
#export LESS_TERMCAP_us=$'\E[01;32m'      # begin underline

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

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Only for testing purposes
# Run inside pi-app root outside of Docker!!!
# PHPSTORM executes phpunit using php with option -dxdebug.coverage_enable=1
# MINE - --coverage-clover ~/.PhpStorm2018.2/system/coverage/checkout$unit.xml
# php storm --coverage-clover /opt/phpstorm-coverage/checkout@unit.xml
#alias code-coverage="vendor/bin/phpunit -d memory_limit=2G --coverage-clover /opt/phpstorm-coverage/checkout@unit.xml --bootstrap tests/unit/bootstrap.php --configuration tests/unit/phpunit.xml tests/unit --teamcity"

# enable bash completion in interactive shells
if ! shopt -oq posix; then
      if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
      elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
      fi
fi

# tabtab source for packages
# uninstall by removing these lines
#[ -f ~/.config/tabtab/__tabtab.bash ] && . ~/.config/tabtab/__tabtab.bash || true

set -o vi
