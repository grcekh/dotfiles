-------------
-- OPTIONS --
-------------

vim.cmd("syntax enable")
vim.cmd("syntax on")

--- 1. Global options

-- vim.o.nocompatible = true -- Fix old Vi bugs
-- vim.o.backspace = 2 -- Make backspace work
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
