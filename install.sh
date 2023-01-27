#!/bin/bash

####Variables

dir=~/dot-files				#dot files directory
olddir=~/dot-files_old		#old dot-files backup directory

#list of files to symlink to homedir
files=".bashrc .gitconfig .inputrc .tmux .tmux.conf .vim .vimrc"	
####

#Create dot-files_old in homedir
echo "Creating $olddir for backyp of any exsitings dotfiles in ~"
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

#Move any exsitinf dotfiles in homedir to backup dir then create symlinks
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/$file $olddir/
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/$file
done

#Apply some changes
source ~/.bashrc
vim +PlugInstall +qall
