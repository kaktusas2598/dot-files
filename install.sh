#!/bin/bash

####Variables

dir=~/dot-files				#dot files directory
olddir=~/dot-files_old		#old dot-files backup directory

#list of files to symlink to homedir
files=".bashrc .bash_aliases .gitconfig .inputrc .tmux .tmux.conf .vim .vimrc"
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

for file in $files; do
	mv ~/$file $olddir/
	ln -s $dir/$file ~/$file
done

# Symlink .config dirs
ln -s $HOME/dot-files/nvim ~/.config
ln -s $HOME/dot-files/kitty ~/.config
ln -s $HOME/dot-files/alacritty ~/.config
ln -s $HOME/dot-files/ranger ~/.config


#Apply some changes
source ~/.bashrc
vim +PlugInstall +qall
