"~~~~~~~~~~~~~~~~~"
"   1. PLUGINS    "
"~~~~~~~~~~~~~~~~~"
" Turn on plugin & indentation support for specific filetypes
filetype plugin indent on

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

" Declare the list of plugins.'

" NERDTree
Plug 'scrooloose/nerdtree'

" FZF
Plug '/usr/local/opt/fzf'

" commentary.vim
Plug 'tpope/vim-commentary'

" lightline.vim
Plug 'itchyny/lightline.vim'

" vim-startify
Plug 'mhinz/vim-startify'

"Color Schemes
" Plug 'flazz/vim-colorschemes'
Plug 'kaicataldo/material.vim'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'joshdick/onedark.vim'

" Syntax Plugins
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'
Plug 'sheerun/vim-polyglot'
Plug 'bfrg/vim-cpp-modern'

" Productivity
Plug 'junegunn/goyo.vim'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-fugitive'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Neovim Completion Manager 2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" completion sources   
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-pyclang'
"Plug 'ncm2/ncm2-tern',{'do':'npm install'}
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-tagprefix'
Plug 'ncm2/ncm2-syntax'
Plug 'Shougo/neco-syntax'
Plug 'ncm2/ncm2-html-subscope'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


"~~~~~~~~~~~~~~~~~~~~~~~~~"
"    2. BASIC SETTINGS    "
"~~~~~~~~~~~~~~~~~~~~~~~~~"
syntax enable
set nocompatible "Fixes old Vi bugs
set backspace=2 "Makes backspace work
set history=500 "Sets undo history size
set ruler "Sets up status bar
set laststatus=2 "Always keeps the status bar active
set number "Turns on line numbering
"set t_Co=256 "Sets Vim to use 256 colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


"~~~~~~~~~~~~~~~~~~~~~~"
"    3. INDENTATION    "
"~~~~~~~~~~~~~~~~~~~~~~"
set tabstop=4 "Sets display width of tabs
set shiftwidth=4 "Sets indentation width
set autoindent "Turns on auto-indenting
set smartindent "Remembers previous indent when creating new lines
set softtabstop=4 expandtab

"Choose between tabs and spaces for indentation by uncommenting one of
"these two. Expand for spaces, noexpand for tabs:"
"set noexpandtab
set expandtab


"~~~~~~~~~~~~~~~~~~~~~~~~~~"
"    4. SEARCH SETTINGS    "
"~~~~~~~~~~~~~~~~~~~~~~~~~~"
set hlsearch "Highlights search terms
set showmatch "Highlights matching parentheses
set ignorecase "Ignores case when searching
set smartcase "Unless you put some caps in your search term


"~~~~~~~~~~~~~~~~~~~~~~"
"    5. KEY MAPPING    "
"~~~~~~~~~~~~~~~~~~~~~~"
let mapleader="-"

"Use jj instead of esc in insert mode
inoremap jj <Esc>`^
"nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree | wincmd p

" Toggle NERDTree
nnoremap <Leader>n :NERDTree<CR>
nnoremap <Leader>t :NERDTreeToggle<CR>

" Window move cursor
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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
let g:startify_custom_header = []

"let g:startify_custom_header=[
"\ '                                       ',
"\ ]

let g:startify_bookmarks = [{"v":"~/.config/nvim/init.vim"}]
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
let g:ncm2_pyclang#library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'

" oF Makefile
let &makeprg = 'if [ -f Makefile ]; then make Release && make RunRelease; else make Release -C .. && make RunRelease -C ..; fi'
"autocmd  BufRead,BufNewFile  *.cpp let &makeprg = 'if [ -f Makefile ]; then make Release && make RunRelease; else make Release -C .. && make RunRelease -C ..; fi'
