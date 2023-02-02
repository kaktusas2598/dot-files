#!/bin/bash

####Variables

dir=~/dot-files				 #dot files directory
olddir=~/dot-files_old		 #old dot-files backup directory
envs=("Ubuntu" "WSL" "MSYS2 None")

#list of files to symlink to homedir
files=".bashrc .bash_aliases .gitconfig .inputrc .tmux .tmux.conf .vim .vimrc .Xdefaults"
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
git submodule init
git submodule update
echo "DONE"

# TODO: change all symlinking to use GNU Stow
for file in $files; do
	echo "Backing up ~/.$file to $olddir/$file"
	mv ~/$file $olddir/
	echo "Symlinking $file to ~/$file"
	ln -s $dir/$file ~/$file
done

# Symlink .config dirs
ln -s $HOME/dot-files/nvim ~/.config
ln -s $HOME/dot-files/kitty ~/.config
ln -s $HOME/dot-files/alacritty ~/.config
ln -s $HOME/dot-files/ranger ~/.config

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
