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

" 2. Syntax
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 3. Productivity
Plug 'junegunn/goyo.vim'
Plug 'wellle/context.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" 4. Color Schemes + Icons
Plug 'sainnhe/everforest'
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
"    6. COLOR SCHEME    "
"~~~~~~~~~~~~~~~~~~~~~~~"
" Enable true colors
if (has('termguicolors'))
  set termguicolors
endif

" Lightline theme 
let g:lightline = {'colorscheme': 'everforest'}

" Everforest color scheme
let g:everforest_background = 'hard'
let g:everforest_disable_italic_comment = 1

" Set color scheme
set background=dark
colorscheme everforest 


"~~~~~~~~~~~~~~~~~~~"
"    7. STARTIFY    "
"~~~~~~~~~~~~~~~~~~~"
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


"~~~~~~~~~~~~~~~~~~~"
"    8. NERDTREE    "
"~~~~~~~~~~~~~~~~~~~"
nnoremap <leader>v :NERDTreeToggle<CR>

let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeShowHidden = 1


"~~~~~~~~~~~~~~"
"    9. FZF    "
"~~~~~~~~~~~~~~"

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" File navigation with fzf and ripgrep
nnoremap <C-f> :Files<CR>
nnoremap <C-g> :Rg<CR>


"~~~~~~~~~~~~~~"
"    9. COC    "
"~~~~~~~~~~~~~~"
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" NOTE: Any missing global extensions will be installed after the coc.nvim
" service is started.
let g:coc_global_extensions = ['coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-json', 'coc-emmet']

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')


"~~~~~~~~~~~~~~~~~~~"
"    10. CONTEXT    "
"~~~~~~~~~~~~~~~~~~~"
let g:context_nvim_no_redraw = 1


