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
set matchpairs+=<:>             " Match <> with %
set vb t_vb=                    " Disable beeping completely
set whichwrap=b,s,<,>,[,]       " Cursor keys move from eol to start of next line

set splitbelow
set splitright

" / searches are case-insensitive if the pattern contains no capitals
set ignorecase 
set smartcase

" Start scrolling 3 lines before reaching the end of the window
set scrolloff=3

" Keeps the cursor in the center of the window
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

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
let NERDTreeChDirMode = 2               " Changing root node (C) changes CWD

" Open BufferGator with ctrl-B
map <C-B> :execute 'BuffergatorToggle'<CR>

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
  
  "colorscheme solarized

  set bg=light
  colorscheme base16-default

  set fillchars=vert:\            " Fill window borders with spaces, not pipes
  "call togglebg#map("<leader>b")  " Use ,b to switch between solarized light/dark

  let NERDChristmasTree=1         " Light up NERDTree
  let NERDTreeDirArrows=1         " Use fancy arrows in NERDTree
  
  set columns=100 lines=100       " Give us a nice big window on startup
  
  "set guifont=Menlo:h19           " Set Menlo 19pt as font
  set guifont=Source\ Code\ Pro:h17           " Set Source Code Pro Light 17pt as font
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
set statusline+=%{substitute(getcwd(),\"^.*/\",\"\",\"\")} " Project name
"set statusline+= #%n               " Buffer number
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
vmap <leader>t= :Tabularize /=<CR>
vmap <leader>t: :Tabularize /:\zs<CR>
"nmap <Leader>bi :source ~/.vim/bundles.vim<cr>:BundleInstall!<cr>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>

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
set shiftround  " Round indent to multiple of 'shiftwidth'.  Applies to > and <
set smarttab    " Backspace at start of line remove shiftwidith worth of space
nmap <leader>et :set expandtab!<CR> " Switch between soft and hard tabs with ,t
nmap <leader>r :retab!<CR>         " Retab entire document to current settings with ,r


" Indent in visual and select mode automatically re-selects
vnoremap > >gv
vnoremap < <gv

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

" Let CtrlP search filenames as well as tags
" Generate tags for Rails projects using :Rtags
" Be sure to install exuberant ctags (i.e. brew install ctags-exuberant)
let g:ctrlp_extensions = ['tag']

" Rpresent & Rinput
let g:rails_projections = {
\ "app/presenters/*_presenter.rb": {
\   "command": "presenter",
\   "affinity": "model",
\   "related": "app/models/%s.rb",
\   "template":
\     "class %SPresenter < BasePresenter\nend",
\   "test": [ "spec/presenters/%s_presenter_spec.rb" ] 
\ },
\ "app/inputs/*_input.rb": {
\   "command": "input"
\ }}

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
function! GetPop()
  colorscheme molokai
  if has("gui_running")
    set guifont=Menlo:h22
    set columns=82
  endif
endfunction
nmap <leader>p :call GetPop()<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
