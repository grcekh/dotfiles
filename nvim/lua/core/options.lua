-------------
-- OPTIONS --
-------------

vim.cmd("syntax enable")
vim.cmd("syntax on")

--- 1. Global options
-- vim.o to set global options

vim.cmd("set nocompatible") -- Fix old Vi bugs
vim.cmd("set backspace=2") -- Make backspace work
vim.cmd("filetype plugin indent on")
vim.o.history = 500

-- Override default split pane directions
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.ruler = true -- Set up status bar
vim.o.laststatus = 2 -- Always keep status bar active

-- Search settings
vim.o.incsearch = true -- Incremental search
vim.o.hlsearch = true -- Highlight search terms
vim.o.showmatch = true -- Highlight matching parentheses
vim.o.ignorecase = true -- Ignore case when searching...
vim.o.smartcase = true -- ...Unless using caps

-- Color scheme

vim.o.termguicolors = true
vim.o.background = "dark"


--- 2. Buffer options
-- vim.bo to set buffer-scoped options
-- For all buffer-local options, set a global option as well

-- Indentation
vim.bo.tabstop = 2
vim.o.tabstop = 2
vim.bo.softtabstop = 2
vim.o.softtabstop = 2
vim.bo.autoindent = true
vim.o.autoindent = true
vim.bo.smartindent = true -- Remembers previous indent when creating newlines
vim.o.smartindent = true
vim.bo.expandtab = true
vim.o.expandtab = true


--- 3. Window options
-- vim.wo to set window-scoped options

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = true


--- 4. Global and buffer variables

-- vim.g.mapleader = "-"
-- vim.b.mapleader = "-"


-- Use persistent history
vim.cmd([[
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile
]])

-- oF Makefile
-- autocmd  BufRead,BufNewFile  *.cpp let &makeprg = 'if [ -f Makefile ]; then make Release && make RunRelease; else make Release -C .. && make RunRelease -C ..; fi'
vim.cmd([[
let &makeprg = 'if [ -f Makefile ]; then make Release && make RunRelease; else make Release -C .. && make RunRelease -C ..; fi'
]])
