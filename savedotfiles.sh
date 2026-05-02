#!/bin/bash
############################
# .make.sh
# Saves dotfiles backup to git
############################

########## Variables

dir=~/dotfiles

filestosave="
.bashrc
.vimrc
.zshrc
.gitignore
.gitconfig
.emacs.d/init.el
.emacs.d/boot.org
.vim/coc-settings.json
.git-templates/prepare-commit-msg
"

##########

echo "Creating $dir for backup of dotfiles..."
mkdir -p "$dir"

echo "Backing up dotfiles..."

for file in $filestosave; do
    src="$HOME/$file"
    dest="$dir/$file"

    if [ -e "$src" ]; then
        mkdir -p "$(dirname "$dest")"
        cp -r "$src" "$dest"
        echo "Saved $file"
    else
        echo "Skipping missing: $file"
    fi
done

echo "Entering dotfiles repo..."
cd "$dir" || exit 1

echo "Staging changes..."
git add .

# Prevent empty commits
git diff --cached --quiet && echo "No changes to commit" && exit 0

echo "Committing changes..."
git commit -m "auto saving updates"

echo "Pushing to remote..."
git push origin HEAD
