"~~~~~~~~~~~~~~~~~~~~~~~~~"
"    1. BASIC SETTINGS    "
"~~~~~~~~~~~~~~~~~~~~~~~~~"
set nocompatible "Fixes old Vi bugs
set backspace=indent,eol,start "More powerful backspacing
set history=500 "Sets undo history size
set ruler "Sets up status bar
set laststatus=2 "Always keeps the status bar active
set number "Turns on line numbering
set relativenumber
"set t_Co=256 "Sets Vim to use 256 colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Override default split pane directions
set splitbelow
set splitright

" Set persistent undo history
set undofile
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir

" Use the new regular expression engine to prevent 'redrawtime exceeded' error
set re=0

" Use a line cursor within insert mode and a block cursor everywhere else.
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Enable mouse reporting
set mouse=a


"~~~~~~~~~~~~~~~~~~~~~~"
"    2. INDENTATION    "
"~~~~~~~~~~~~~~~~~~~~~~"
set tabstop=2 "Sets display width of tabs
set shiftwidth=2 "Sets indentation width
set autoindent "Turns on auto-indenting
set smartindent "Remembers previous indent when creating new lines
set softtabstop=2 expandtab

"Choose between tabs and spaces for indentation by uncommenting one of
"these two. Expand for spaces, noexpand for tabs:"
"set noexpandtab
set expandtab


"~~~~~~~~~~~~~~~~~~~~~~~~~~"
"    3. SEARCH SETTINGS    "
"~~~~~~~~~~~~~~~~~~~~~~~~~~"
set hlsearch "Highlights search terms
set is hls "Incremental search and highlight all matches
set showmatch "Highlights matching parentheses
set ignorecase "Ignores case when searching
set smartcase "Unless you put some caps in your search term


"~~~~~~~~~~~~~~~~~~~~~~"
"    4. KEY MAPPING    "
"~~~~~~~~~~~~~~~~~~~~~~"
let mapleader="-"

"Use jj instead of esc in insert mode
inoremap jj <Esc>`^

" Window cursor motions
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Copy to system clipboard
vnoremap <leader>y  "+y
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y
nnoremap <leader>yy  "+yy

" Paste from system clipboard
vnoremap <leader>p "+p
vnoremap <leader>P "+P
nnoremap <leader>p "+p
nnoremap <leader>P "+P


"~~~~~~~~~~~~~~~~~~~~~~~"
"    5. COLOR SCHEME    "
"~~~~~~~~~~~~~~~~~~~~~~~"
" Enable true colors
if (has('termguicolors'))
  set termguicolors
endif

" Set color scheme
set background=dark
syntax enable
colorscheme everforest 

