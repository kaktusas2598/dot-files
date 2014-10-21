# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

#change umask to mkae dir sharing easier
umask 0002

#Ignore duplicates in history and increase its size
export HISTCONTROL=ignoredups
export HISTSIZE=1000

#Add ~/bin/ dir to PATH so we can execute our own scripts
export PATH=~/bin:"$PATH"

#Helpful aliases
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias vi='vim' #Fedora bug? Need to install sudo...
#alias most_used='history|awk '{print $2}'|awk 'BEGIN {FS="|"} {print $1}'|sort|uniq -c|sort -r'
alias star_wars='telnet towel.blinkenlights.nl'
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
if [ -x /usr/bin/cowsay ]; then
	echo STANCEGO | cowsay -n -f sodomized.cow
fi
