"~~~~~~~~~~~~~~~~~"
"   1. PLUGINS    "
"~~~~~~~~~~~~~~~~~"
" Turn on plugin & indentation support for specific filetypes
filetype plugin indent on

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

" Declare the list of plugins.

" Core 
"Plug 'scrooloose/nerdtree'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug '/usr/local/opt/fzf'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Color Schemes + Icons
" Plug 'flazz/vim-colorschemes'
Plug 'kaicataldo/material.vim'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'arzg/vim-colors-xcode'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'bfrg/vim-cpp-modern'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tmsvg/pear-tree'

" Productivity
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/goyo.vim'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

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

" Toggle file manager
nnoremap <Leader>t :CHADopen<CR>

" Window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


"~~~~~~~~~~~~~~~~~~~~~~~"
"   6. COLOR SCHEME    "
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
"      7. COC.NVIM      "
"~~~~~~~~~~~~~~~~~~~~~~~"
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-vetur',
  \ 'coc-tsserver',
  \ 'coc-json', 
  \ 'coc-emmet',
  "\ 'coc-clangd',
  "\ 'coc-pairs',
  \ ]

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


"~~~~~~~~~~~~~~~~~~~~~~~"
"      8. PEAR-TREE     "
"~~~~~~~~~~~~~~~~~~~~~~~"
" Default rules for matching:
let g:pear_tree_pairs = {
            \ '(': {'closer': ')'},
            \ '[': {'closer': ']'},
            \ '{': {'closer': '}'},
            \ "'": {'closer': "'"},
            \ '"': {'closer': '"'},
            \ '/*': {'closer': '*/'},
            \ '<!--': {'closer': '-->'},
            \ '```': {'closer': '```'},
            \ }
" See pear-tree/after/ftplugin/ for filetype-specific matching rules

" Pear Tree is enabled for all filetypes by default:
let g:pear_tree_ft_disabled = []

" Pair expansion is dot-repeatable by default:
let g:pear_tree_repeatable_expand = 0

" Smart are disabled by default:pairs
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" If enabled, smart pair functions timeout after 60ms:
let g:pear_tree_timeout = 60

" Automatically map <BS> and <CR>
let g:pear_tree_map_special_keys = 0

" Default mappings:
imap <BS> <Plug>(PearTreeBackspace)
imap <CR> <Plug>(PearTreeExpand)
" imap <Esc> <Plug>(PearTreeFinishExpansion)
" Pear Tree also makes <Plug> mappings for each opening and closing string.
"     :help <Plug>(PearTreeOpener)
"     :help <Plug>(PearTreeCloser)

" Not mapped by default:
" <Plug>(PearTreeSpace)
" <Plug>(PearTreeJump)
" <Plug>(PearTreeExpandOne)
" <Plug>(PearTreeJNR)


"~~~~~~~~~~~~~~~~~~~~~~~"
"      9. STARTIFY      "
"~~~~~~~~~~~~~~~~~~~~~~~"
let g:startify_custom_header = []

let g:startify_bookmarks = [{"v":"~/.config/nvim/init.vim"}]
let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'files',     'header': ['   Recent Files']            },
      \ { 'type': 'dir',       'header': ['   Recent Files in '. getcwd()] },
\ ]
let g:startify_files_number = 5 

" load on startup
augroup startup
    autocmd!
    autocmd VimEnter * Startify
    autocmd VimEnter * CHADopen --nofocus
augroup END


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"    10. SYNTAX HIGHLIGHTING    "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
let g:cpp_simple_highlight = 1
let g:cpp_named_requirements_highlight = 1

" Highlight yanked text
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END


"~~~~~~~~~~~~~~~~~~~~~~~~"
"   11. MISCELLANEOUS    "
"~~~~~~~~~~~~~~~~~~~~~~~~"
" Ignore in file manager
let g:chadtree_ignores = { 'path': 'node_modules' }

let g:ncm2_pyclang#library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'

" oF Makefile
let &makeprg = 'if [ -f Makefile ]; then make Release && make RunRelease; else make Release -C .. && make RunRelease -C ..; fi'
"autocmd  BufRead,BufNewFile  *.cpp let &makeprg = 'if [ -f Makefile ]; then make Release && make RunRelease; else make Release -C .. && make RunRelease -C ..; fi'
