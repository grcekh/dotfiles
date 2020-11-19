"~~~~~~~~~~~~~~~~~"
"   1. PLUGINS    "
"~~~~~~~~~~~~~~~~~"
" Turn on plugin & indentation support for specific filetypes
filetype plugin indent on

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

" Declare the list of plugins.

" Core 
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'romgrk/barbar.nvim'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'bfrg/vim-cpp-modern'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tmsvg/pear-tree'

" Productivity
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'wellle/context.vim'
Plug 'dbeniamine/cheat.sh-vim'

" Color schemes + icons
Plug 'sainnhe/gruvbox-material'
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
" set noexpandtab
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

" FZF + ripgrep
nnoremap <C-p> :FZF<Cr>
nnoremap <C-f> :Files<Cr>
nnoremap <C-g> :Rg<Cr>

" Window navigation
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
        \ 'colorscheme': 'gruvbox_material',
        \ }

" Set color scheme
set background=dark
let g:gruvbox_material_palette = {
    \ 'bg0':              ['#292d34',   '234'],
    \ 'bg1':              ['#3f4451',   '235'],
    \ 'bg2':              ['#292d34',   '235'],
    \ 'bg3':              ['#3f4451',   '237'],
    \ 'bg4':              ['#4c5161',   '237'],
    \ 'bg5':              ['#7b7974',   '239'],
    \ 'bg_statusline1':   ['#404451',   '235'],
    \ 'bg_statusline2':   ['#404451',   '235'],
    \ 'bg_statusline3':   ['#404451',   '239'],
    \ 'bg_diff_green':    ['#32361a',   '22'],
    \ 'bg_visual_green':  ['#333e34',   '22'],
    \ 'bg_diff_red':      ['#3c1f1e',   '52'],
    \ 'bg_visual_red':    ['#442e2d',   '52'],
    \ 'bg_diff_blue':     ['#0d3138',   '17'],
    \ 'bg_visual_blue':   ['#2e3b3b',   '17'],
    \ 'bg_visual_yellow': ['#473c29',   '94'],
    \ 'bg_current_word':  ['#32302f',   '236'],
    \ 'fg0':              ['#d1ccc2',   '223'],
    \ 'fg1':              ['#d1ccc2',   '223'],
    \ 'red':              ['#ea6962',   '167'],
    \ 'orange':           ['#e78a4e',   '208'],
    \ 'yellow':           ['#d8a657',   '214'],
    \ 'green':            ['#a9b665',   '142'],
    \ 'aqua':             ['#89b482',   '108'],
      \ 'blue':             ['#7daea3',   '109'],
      \ 'purple':           ['#d3869b',   '175'],
      \ 'bg_red':           ['#ea6962',   '167'],
      \ 'bg_green':         ['#a9b665',   '142'],
      \ 'bg_yellow':        ['#d8a657',   '214'],
      \ 'grey0':            ['#7b7974',   '243'],
      \ 'grey1':            ['#99958d',   '245'],
      \ 'grey2':            ['#acb2be',   '246'],
      \ 'none':             ['NONE',      'NONE']
      \ }
colorscheme gruvbox-material


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

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Snippets
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

" Load on startup
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
"     11. BARBAR.VIM     "
"~~~~~~~~~~~~~~~~~~~~~~~~"
" Magic buffer-picking mode
nnoremap <silent> <C-s> :BufferPick<CR>
" Sort automatically by:
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
" Re-order to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Move to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>

let bufferline = {}
" Show a shadow over the editor in buffer-pick mode
let bufferline.shadow = v:true
" Enable/disable animations
let bufferline.animation = v:true
" Enable/disable icons
let bufferline.icons = v:false
" Enable/disable close button
let bufferline.closable = v:false
" Enables/disable clickable tabs
let bufferline.clickable = v:false
" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true
" Sets the maximum padding width with which to surround each tab
let bufferline.maximum_padding = 4


"~~~~~~~~~~~~~~~~~~~~~~~~"
"   12. MISCELLANEOUS    "
"~~~~~~~~~~~~~~~~~~~~~~~~"
" Ignore in file manager
let g:chadtree_ignores = { 'path': 'node_modules' }

" Use Markdown in VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

" Context.vim 
let g:context_nvim_no_redraw = 1

" As of MacOS Catalina
let g:ncm2_pyclang#library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'

" oF Makefile
let &makeprg = 'if [ -f Makefile ]; then make Release && make RunRelease; else make Release -C .. && make RunRelease -C ..; fi'
"autocmd  BufRead,BufNewFile  *.cpp let &makeprg = 'if [ -f Makefile ]; then make Release && make RunRelease; else make Release -C .. && make RunRelease -C ..; fi'

