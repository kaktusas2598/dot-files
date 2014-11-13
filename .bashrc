# Use case-insensitive filename globbing
shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
shopt -s histappend
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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

HISTSIZE=1000
HISTFILESIZE=2000
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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -hF --color=auto' #Classify files
    alias l.='ls -d .* --color=auto'
    alias ll='ls -l --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
#alias la='ls -A'
#alias l='ls -CF'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

alias vi='vim' #Fedora bug? Need to install sudo...
#alias most_used='history|awk '{print $2}'|awk 'BEGIN {FS="|"} {print $1}'|sort|uniq -c|sort -r'
alias star_wars='telnet towel.blinkenlights.nl'

#----

#Customize shell prompt
function prompt
{
	local WHITE="\[\033[1;37m\]"
	local GREEN="\[\033[0;32m\]"
	local RED="\[\033[0;31m\]"
	local GRAY="\[\033[0;37m\]"
	local BLUE="\[\033[0;34m\]"
	export PS1="${RED}\A${WHITE}[${GREEN}\u@\h ${RED}\W${WHITE}]${GREEN}\$ ${GRAY}"
}
prompt
#Greeting
if [ -x /usr/bin/cowsay -o -x /usr/games/cowsay ]; then
	echo STANCEGO | cowsay -n -f sodomized.cow #or sodomized-sheep.cow
fi
#MY

#colored terminal
export TERM="screen-256color" #xterm256-color with tmux doesnt work right
alias atsipisk='exit'
#Convert all files in dir from CRLF to LF endings
alias dirToUnix='find . -type f -exec dos2unix {} \;'

#Open file with default x application
alias nu="xdg-open"
