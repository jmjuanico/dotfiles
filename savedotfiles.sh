#!/bin/bash
############################
# .make.sh
# Saves dotfiles backup to git
############################

dir=~/dotfiles
githooks=~/.git-templates/hooks

filestosave="bashrc vimrc zshrc gitignore gitconfig emacs.d/init.el emacs.d/boot.org vim/coc-settings.json"

echo "Creating $dir"
mkdir -p "$dir"

echo "Backing up dotfiles..."

for file in $filestosave; do
    src="$HOME/.$file"
    dest="$dir/$file"

    if [ -f "$src" ]; then
        mkdir -p "$(dirname "$dest")"
        cp "$src" "$dest"
        echo "Saved $file"
    else
        echo "Skipping missing: $file"
    fi
done

echo "Saving git hooks..."
cp -r "$githooks" "$dir/git-hooks"

cd "$dir" || exit

git add .

git diff --cached --quiet && echo "No changes to commit" && exit 0

git commit -m "auto saving updates"

git push origin HEAD
