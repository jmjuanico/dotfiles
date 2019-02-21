#!/bin/bash
############################
# .make.sh
# Saves dotfiles backup to git
############################

########## Variables

dir=~/dotfiles
filestosave="bashrc vimrc zshrc oh-my-zsh gitignore"

##########

# create dotffiles dir
echo "Creating $dir for backup of any existing dotfiles in ~"
if [ ! -d "$dir" ]; then
  mkdir -p $dir
fi

echo "Go to $dir and save dotfiles"
# save and push to git
for file in $filestosave; do
    cp ~/.$file $dir/$file
done

cd $dir
git add .
git commit . -m "auto saving updates"
git push origin master