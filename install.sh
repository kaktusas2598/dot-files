#!/bin/bash

####Variables

dir=~/dot-files				 #dot files directory
olddir=~/dot-files_old		 #old dot-files backup directory
envs=("Ubuntu" "WSL" "MSYS2 None")

#list of modules to stow
modules="bash readline vim tmux git X nvim ranger alacritty kitty i3"
####

#Create dot-files_old in homedir
echo "Creating $olddir for backup of any exsitings dotfiles in ~"
mkdir -p $olddir
echo "DONE"

#Change to dot-files
echo "Changing to the $dir directory"
cd $dir
echo "DONE"

#Initialize git submodules
echo "Initialising git submodules"
git submodule init && git submodule update
echo "DONE"

echo "Stowing dot files"
for module in $modules; do
	# TODO: Loop through files in each module and backup
	#echo "Backing up ~/.$file to $olddir/$file"
	#mv ~/$file $olddir/
	stow -v $module
done
echo "DONE"

# Prompt for specific environment and apply spcific configs
echo "Select specific environment you're on:"
select env in ${envs[@]}
do
    case $env in
        None) echo "no selected"
            break ;;
        *) echo "Copying .env/$env.bashrc to ~/.bash_env"
            cp $HOME/dot-files/.env/$env.bashrc ~/.bash_env
            break ;;
    esac
done

echo "Applying bash config"
source ~/.bashrc
echo "Installing Vim Plugins"
vim +PlugInstall +qall
