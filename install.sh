#!/bin/sh

mkdir -p ~/.vim/autoload
curl --insecure -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
