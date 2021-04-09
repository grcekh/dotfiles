-------------
-- OPTIONS --
-------------

-- Find option scope:
-- :h tabstop --> local to buffer

--[[
"~~~~~~~~~~~~~~~~~~~~~~~~~"
"    2. BASIC SETTINGS    "
"~~~~~~~~~~~~~~~~~~~~~~~~~"
set nocompatible "Fixes old Vi bugs
set backspace=2 "Makes backspace work
set history=500 "Sets undo history size
"set t_Co=256 "Sets Vim to use 256 colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Use persistent history
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile
--]]

vim.cmd("syntax enable")
vim.cmd("syntax on")

--- 1. Global options

vim.o.nocompatible = true -- Fix old Vi bugs
vim.o.backspace = 2 -- Make backspace work
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


--- 2. Buffer options
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

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = true


--- 4. Global and buffer variables

vim.g.mapleader = "-"
vim.b.mapleader = "-"


