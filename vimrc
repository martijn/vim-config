" martijn@lico.nl .vimrc

set nocompatible

silent! runtime bundles.vim     " Load bundles

" General settings {{{

set nobackup                    " Don't keep backups of files
set nowritebackup               " Don't make backups when writing to files
set history=50                  " keep 50 lines of command line history
set ruler                       " show the cursor position all the time
set showmode                    " show insert, replace or visual status
set showcmd                     " display incomplete commands
set nocursorline                " don't highlight current line
set incsearch                   " do incremental searching
set hlsearch                    " highlight search matches
set backspace=indent,eol,start  " backspace over everything in insert mode
set wildmenu                    " enhanced command line completion
set wildmode=list:longest,full  " list all matches, complete to longest, cycle full
set complete=.,t                " Only use current file and ctags for completion
set autoindent                  " Automatically indent new lines
set foldmethod=marker           " Fold on markers by default
set foldlevel=99                " But open all by default
set encoding=utf-8              " Best for MacVim/gVim and utf-8 terminals
set autoread                    " Automatically reread externally changed files
set gdefault                    " Always set g flag on regexes

set splitbelow
set splitright

" / searches are case-insensitive if the pattern contains no capitals
set ignorecase 
set smartcase

" Start scrolling 3 lines before reaching the end of the window
set scrolloff=3

if version >= 703                 " Vim 7.3 only
  set colorcolumn=80              " Highlight 80th column
end

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" }}}

" Some convenient key mappings {{{

" j/k skip 'screen lines' instead of 'document lines'
nnoremap j gj
nnoremap k gk

map Q gq            " Disable Ex mode, remap Q to formatting

" Open NERDTree with ctrl-T
map <C-T> :execute 'NERDTreeToggle ' . getcwd()<CR>

" Make :W, :Q act like :w, :q (common typo)
cmap W w
cmap Q q

" Escape from insert mode with jj 
inoremap jj <ESC>

" }}}

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
endif

" Interface options {{{

set bg=dark                       " Always use/assume dark background

if has("gui_running")
  " Options for Macvim/gVim
 
  set guioptions-=T               " Hide the toolbar
  
  colorscheme solarized           " Use solarized in Macvim/gVim
  set fillchars=vert:\            " Fill window borders with spaces, not pipes
  call togglebg#map("<leader>b")  " Use ,b to switch between solarized light/dark

  let NERDChristmasTree=1         " Light up NERDTree
  let NERDTreeDirArrows=1         " Use fancy arrows in NERDTree
  
  set columns=100 lines=100       " Give us a nice big window on startup
  
  set guifont=Menlo:h19           " Set Menlo 19pt as font
  set linespace=2                 " Add 2px of extra line spacing

  if has('macunix')               " MacVim-only option
    set fuoptions=maxvert,maxhorz " Use the full screen in full screen mode
  end
else
  " Options for consle vim
  colorscheme molokai             " Use molokai in console
end

" }}}

" Status line {{{

" Always display the status line
set laststatus=2

"http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
set statusline=
set statusline+=%<                " Truncation point
set statusline+=%f                " Path to the file, as typed or relative to current dir
set statusline+=%([%R%M]%)        " Read-only (RO), modified (+) and unmodifiable (-) flags between braces
set statusline+=\ %y              " Filetype
set statusline+=\ %{fugitive#statusline()}  " Show Git info, via fugitive.git
set statusline+=%=                " Right-align following items
set statusline+=#%n               " Buffer number
"set statusline+=%#statuslinenc#
"set statusline+=\ %{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=\ %l/%L,          " Current line number/total number of lines
set statusline+=%c                " Column number
"set statusline+=%V                " -{Virtual column number} (Not displayed if equal to 'c')
"set statusline+=\ %p%%            " Percentage of lines through the file

" }}}

" Leader commands (leader is ,) {{{

let mapleader=","

nmap <leader>l :set list!<CR>     " Show invisibles with ,l
set listchars=tab:▸\ ,eol:¬,trail:\ 

nmap <leader>< :bprevious<CR>     " Previous buffer with ,<
nmap <leader>> :bnext<CR>         " Next buffer with ,>
nmap <leader>n :set number!<CR>   " Toggle line numbers with ,n
nmap <leader>w :w<CR>             " Save document with ,w
nmap <leader>z :GundoToggle<CR>   " Toggle Gundo with ,z
nmap <leader>c :cd %:p:h<CR>      " CD to path of current file
nmap <leader>h :nohlsearch<CR>    " Clear highlight after a search

" Comment lines with ,/
vmap <leader>/ <plug>NERDCommenterInvert
nmap <leader>/ <plug>NERDCommenterInvert

" Spell checking (,ss to enable)
nmap <leader>sn :set spelllang=nl<CR>
nmap <leader>se :set spelllang=en<CR>
nmap <leader>ss :set spell!<CR>

" }}}

" Configuration of tab characters (2 space soft tabs by default) {{{

set tabstop=2
set shiftwidth=2
set expandtab
nmap <leader>t :set expandtab!<CR> " Switch between soft and hard tabs with ,t
nmap <leader>r :retab!<CR>         " Retab entire document to current settings with ,r

" }}}

" Redefine cursor keys to something useful {{{

"nnoremap <Left> :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
"nnoremap <Up> :echoe "Use k"<CR>
"nnoremap <Down> :echoe "Use j"<CR>
"nnoremap <Left> :GundoToggle<CR>
"nnoremap <Right> :NERDTreeToggle<CR>
"nnoremap <Up> :set list!<CR>
"nnoremap <Down> :set number!<CR>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" }}}

" Trailing whitespace verijwderen
" http://vimcasts.org/episodes/tidying-whitespace/
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

nmap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>

" Use :X to enable blowfish encryption on a file
if version >= 703
  set cryptmethod=blowfish
endif

" Open my encrypted, version controlled notes file
command Notes tabnew ~/Documents/notes/notes.markdown

" This is supposed to make Ruby files open faster
" https://github.com/vim-ruby/vim-ruby/issues/33
if !empty(matchstr($MY_RUBY_HOME, 'jruby'))
  let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'),"\n"),',')
endif

" Bracketed paste mode support
" http://stackoverflow.com/questions/5585129/pasting-code-into-terminal-window-into-vim-on-mac-os-x
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

" LaTeX settings
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 --interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'Skim'

" Vim Indent Guides configuration (,ig)
let g:indent_guides_start_level = 2

" Sometimes you need your editor to pop (,p)
function! Pop()
  colorscheme molokai
  if has("gui_running")
    set guifont=Menlo:h22
    set columns=82
  endif
endfunction
nmap <leader>p :call Pop()<CR>
