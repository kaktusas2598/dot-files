# Use case-insensitive filename globbing
shopt -s nocaseglob

# Enable dot files globbing, wildcard matches hidden files
#shopt -s dotglob

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
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias la='ls -A'
#alias l='ls -CF'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

alias c='clear'

#For lazy devs like me
alias gut='git'
alias got='git'

#alias most_used='history|awk '{print $2}'|awk 'BEGIN {FS="|"} {print $1}'|sort|uniq -c|sort -r'
alias star_wars='telnet towel.blinkenlights.nl'
#WINE & WINE programs aliases
alias wine32='env WINEARCH=win32 WINEPREFIX="/home/madvi11ain/.wine32" wine'
alias League_of_Legends='cd /home/madvi11ain/.wine32/drive_c/Riot\ Games/League\ of\ Legends/RADS/system/ && wine32 rads_user_kernel.exe run lol_launcher $(ls ../projects/lol_launcher/releases/) LoLLauncher.exe'
#----

#Get git branch name
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#Customize shell prompt
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
	export PS1="${RED}${TIME}${WHITE}[${GREEN}${USER}${YELLOW}@${BLUE}${HOST} ${RED}${PWD}${WHITE}]${YELLOW}\$(parse_git_branch) \$ ${GRAY}"
	#export PS1="${RED}\A${WHITE}[${GREEN}\u@\h ${RED}\W${WHITE}]${GREEN}\$ ${GRAY}"
}
prompt
#Greeting
#if [ -x /usr/bin/cowsay -o -x /usr/games/cowsay ]; then
	#NOTE: can insert cowsay greeting here
#fi

#extract any archive ;)
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
export TERM="screen-256color" #xterm256-color with tmux doesnt work right
alias atsipisk='exit'
#Convert all files in dir from CRLF to LF endings
alias dirToUnix='find . -type f -exec dos2unix {} \;'
#Same as CMD+K on MAC, clears whole scrollable buffer, not just visible part							
alias clear="clear && printf '\e[3J'"

#For linux OS, alias xdg-open as open to make it work just like in OS X
if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	alias open="xdg-open"
fi

alias up="cd .."
alias ..="cd .."
#Hardware and drivers info
alias hardware='lspci -v | less'
#Web
alias laravel_server='php artisan serve'

#Colored man
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'      # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m'   # begin standout-mode - info box                              
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[01;32m'      # begin underline
