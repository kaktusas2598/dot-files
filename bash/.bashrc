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

# Set default editor NeoVim -> Vim -> Vi
if command -v nvim > /dev/null; then
	export EDITOR=nvim
elif command -v vim > /dev/null; then
	export EDITOR=vim
else
	export EDITOR=vi
fi

# Set local inputrc for stuff like case-insensitive auto completion in bash, vi mode keybinds
export INPUTRC="$HOME/.inputrc"

#----ALIASES----
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

# Automatically change directory in bash after closing ranger
# q will quit as usual while Q will quit all tabs and cd directory in bash without creating nested ranger instances
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )

    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

#colored terminal
#export TERM="screen-256color" #xterm256-color with tmux doesnt work right
#Convert all files in dir from CRLF to LF endings

#Colored man
#export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
#export LESS_TERMCAP_md=$'\E[01;31m'      # begin bold
#export LESS_TERMCAP_me=$'\E[0m'           # end mode
#export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
#export LESS_TERMCAP_so=$'\E[01;44;33m'   # begin standout-mode - info box
#export LESS_TERMCAP_ue=$'\E[0m'           # end underline
#export LESS_TERMCAP_us=$'\E[01;32m'      # begin underline


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

# Source environment specific bash configs
if [ -f ~/.bash_env ]; then
    source ~/.bash_env
fi
