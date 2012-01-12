set nocompatible

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'martijn/molokai'

Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'kchmck/vim-coffee-script'

Bundle 'jcf/vim-latex'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'

Bundle 'sjl/gundo.vim'

" Extra text objects
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'bkad/CamelCaseMotion'
Bundle 'michaeljsmith/vim-indent-object'

" Insert mode stuff
Bundle 'ervandew/supertab'
Bundle 'Raimondi/delimitMate'

"Bundle 'Lokaltog/vim-powerline'

filetype plugin indent on

runtime macros/matchit.vim               " For textobj-rubyblock
