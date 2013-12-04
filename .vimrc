set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'



" Formatting bundles:
Bundle 'tpope/vim-haml'
Bundle 'kchmck/vim-coffee-script'
" 
" " Navigation bundles:
Bundle 'kien/ctrlp.vim'
"Bundle 'scrooloose/nerdtree'
 
 
" Editing bundles:
Bundle 'godlygeek/tabular'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tComment'
Bundle 'Syntastic'
 
" Bundle 'vim-smartinput' starting out without

" Tool bundles:
Bundle 'tpope/rbenv'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'ack.vim'
Bundle 'tpope/vim-dispatch.git'
Bundle 'thoughtbot/vim-rspec'
Bundle 'Rename2'


" Window management
Bundle 'myusuf3/numbers.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Lokaltog/vim-powerline'


"Themes
"Bundle 'sjl/badwolf'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'tomasr/molokai'
"Bundle 'zaiste/Atom'

filetype plugin indent on     " required! 

"colorscheme grb256


" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set guifont=Source\ Code\ Pro:h13
endif

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep


set tabstop=2     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set expandtab 
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set pastetoggle=<F2>

"No more silly built in file explorer."
"let g:NERDTreeHijackNetrw = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"Persistent undo
try
    if MySys() == "windows"
      set undodir=C:\Windows\Temp
    else
      set undodir=~/.vim_runtime/undodir
    endif

    set undofile
catch
endtry

" change the mapleader from \ to ,
let mapleader=","
" quickly switch between main and alternate file
map ,, <C-^>

nnoremap <leader>l :ls<CR>:b<space>

" This solves the problem that pressing down jumpes your
" cursor “over” the current line to the next line. It changes behaviour so
" that it jumps to the next row in the editor (much more natural):
nnoremap j gj
nnoremap k gk

set showcmd

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"colorscheme badwolf 

nnoremap <F3> :NumbersToggle<CR> 
map <F7> mzgg=G`z<CR>

set encoding=utf-8
set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
 set scrolloff=3


" Setup of the vim-rspec plugin
let g:rspec_command = "Dispatch zeus rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
" Setup autocomplete
"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

