call plug#begin()

Plug 'gmarik/vundle'
Plug 'NLKNguyen/papercolor-theme'

Plug 'elixir-lang/vim-elixir'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-jdaddy' " format json with gqaj
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'kchmck/vim-coffee-script'
Plug 'groenewege/vim-less'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rodjek/vim-puppet'
Plug 'gregsexton/gitv'
Plug 'ConradIrwin/vim-bracketed-paste'

Plug 'henrik/vim-qargs' " :Qargs / :Qdo

Plug 'jcf/vim-latex'
Plug 'godlygeek/tabular'

Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'mileszs/ack.vim'

Plug 'sjl/gundo.vim'

Plug 'junegunn/goyo.vim'

" Extra text objects
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'bkad/CamelCaseMotion'
Plug 'michaeljsmith/vim-indent-object'

" Insert mode stuff
Plug 'ervandew/supertab'

Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

runtime macros/matchit.vim               " For textobj-rubyblock
