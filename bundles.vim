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

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'kchmck/vim-coffee-script'

Bundle 'jcf/vim-latex'
Bundle 'godlygeek/tabular'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'

Bundle 'sjl/gundo.vim'

" Extra text objects
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'bkad/CamelCaseMotion'
Bundle 'michaeljsmith/vim-indent-object'

" Insert mode stuff
Bundle 'ervandew/supertab'

"Bundle 'Lokaltog/vim-powerline'
Bundle 'nathanaelkane/vim-indent-guides'

Bundle 'Rykka/ColorV'

filetype plugin indent on

runtime macros/matchit.vim               " For textobj-rubyblock
