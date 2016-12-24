#!/bin/sh
#
# Inspired by https://raw.github.com/michaeljsmalley/dotfiles/master/makesymlinks.sh
#
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
#

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="gemrc gitconfig powconfig psqlrc rspec tmux.conf vimrc zshrc"

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir

for file in $files; do
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

echo "done"


