"~~~~~~~~~~~~~~~~~"
"   1. PLUGINS    "
"~~~~~~~~~~~~~~~~~"
" Automatic installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.'

" 1. Core
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" 2. Syntax Plugins
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'

" 3. Productivity
Plug 'junegunn/goyo.vim'
Plug 'wellle/context.vim'

" 4. Color Schemes
Plug 'joshdick/onedark.vim'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()


"~~~~~~~~~~~~~~~~~~~~~~~~~"
"    2. BASIC SETTINGS    "
"~~~~~~~~~~~~~~~~~~~~~~~~~"
set nocompatible "Fixes old Vi bugs
set backspace=2 "Makes backspace work
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

" Use persistent history
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile


"~~~~~~~~~~~~~~~~~~~~~~"
"    3. INDENTATION    "
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
"    4. SEARCH SETTINGS    "
"~~~~~~~~~~~~~~~~~~~~~~~~~~"
set hlsearch "Highlights search terms
set is hls "Incremental search and highlight all matches
set showmatch "Highlights matching parentheses
set ignorecase "Ignores case when searching
set smartcase "Unless you put some caps in your search term


"~~~~~~~~~~~~~~~~~~~~~~"
"    5. KEY MAPPING    "
"~~~~~~~~~~~~~~~~~~~~~~"
let mapleader="-"

"Use jj instead of esc in insert mode
inoremap jj <Esc>`^

" Toggle NERDTree
nnoremap <Leader>v :NERDTreeToggle<CR>

" Window cursor motions
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Copy to system clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from system clipboard
vnoremap <leader>p "+p
vnoremap <leader>P "+P
nnoremap <leader>p "+p
nnoremap <leader>P "+P


"~~~~~~~~~~~~~~~~~~~~~~~"
"    6. COLOR SCHEME    "
"~~~~~~~~~~~~~~~~~~~~~~~"
" Enable true colors
if (has('termguicolors'))
  set termguicolors
endif

" Material theme settings
let g:material_theme_style = 'default'
let g:material_terminal_italics = 1

" Lightline theme 
let g:lightline = {
        \ 'colorscheme': 'onedark',
        \ }

" Set color scheme
set background=dark
colorscheme onedark 


"~~~~~~~~~~~~~~~~~~~~~~~"
"    7. STARTIFY        "
"~~~~~~~~~~~~~~~~~~~~~~~"
let g:startify_custom_header = [
    \ '     ▀▄   ▄▀                   ▄ ▀▄   ▄▀ ▄   ',
    \ '    ▄█▀███▀█▄    █ █ █ █▀▄▀█   █▄███████▄█   ',
    \ '   █▀███████▀█   ▀▄▀ █ █ ▀ █   ███▄███▄███   ',
    \ '   █ █▀▀▀▀▀█ █                 ▀█████████▀   ',
    \ '      ▀▀ ▀▀                     ▄▀     ▀▄    ',
\ ]

let g:startify_bookmarks = [{"v":"~/dotfiles/.vimrc"}]
let g:startify_lists = [
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'files',     'header': ['   Recent Files']            },
    \ { 'type': 'dir',       'header': ['   Recent Files in '. getcwd()] },
\ ]
let g:startify_files_number = 5 

" NERDTree at startup
autocmd VimEnter *
        \   if !argc()
        \ |   Startify
        \ |   NERDTree
        \ |   wincmd w
        \ | endif


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"    8. SYNTAX HIGHLIGHTING    "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
let g:cpp_simple_highlight = 1
let g:cpp_named_requirements_highlight = 1


"~~~~~~~~~~~~~~~~~~~~~~~~"
"    9. MISCELLANEOUS    "
"~~~~~~~~~~~~~~~~~~~~~~~~"
" FZF
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" NERDTree
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeShowHidden = 1

" Context.vim 
let g:context_nvim_no_redraw = 1
