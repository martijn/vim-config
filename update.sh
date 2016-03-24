#!/bin/sh

OLDPWD=$PWD

cd ~/.vim
git pull
vim +PlugInstall +qall

cd $OLDPWD

echo "Done!"
