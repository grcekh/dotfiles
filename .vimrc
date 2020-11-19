"~~~~~~~~~~~~~~~~~"
"   1. PLUGINS    "
"~~~~~~~~~~~~~~~~~"
" Turn on plugin & indentation support for specific filetypes
filetype plugin indent on

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

" Declare the list of plugins.'

" Core 
Plug 'scrooloose/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'
Plug 'jiangmiao/auto-pairs'

" Productivity
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'wellle/context.vim'

"Color Schemes + icons
Plug 'kaicataldo/material.vim'
Plug 'joshdick/onedark.vim'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'

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
set showmatch "Highlights matching parentheses
set ignorecase "Ignores case when searching
set smartcase "Unless you put some caps in your search term


"~~~~~~~~~~~~~~~~~~~~~~"
"    5. KEY MAPPING    "
"~~~~~~~~~~~~~~~~~~~~~~"
let mapleader="-"

"Use jj instead of esc in insert mode
inoremap jj <Esc>`^

" Toggle file manager
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
" Ignore in file manager
let g:NERDTreeIgnore = ['^node_modules$']

" Use Markdown in VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

" Context.vim 
let g:context_nvim_no_redraw = 1

" As of MacOS Catalina
let g:ncm2_pyclang#library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
