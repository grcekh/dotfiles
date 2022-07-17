----------------
-- KEYMAPPING --
----------------

local vim = vim
local map = require("utils").map
local opts = { silent = true }

-- Set global and buffer leader key
vim.g.mapleader = "-"
vim.b.mapleader = "-"

-- Use jj instead of esc in insert mode
map("i", "jj", "<Esc>", opts)

-- Window navigation
map("n", "<C-j>", "<C-W>j", opts)
map("n", "<C-k>", "<C-W>k", opts)
map("n", "<C-h>", "<C-W>h", opts)
map("n", "<C-l>", "<C-W>l", opts)

-- Copy and paste to system clipboard
map("v", "<Leader>y", '"+y', opts)
map("n", "<Leader>y", '"+y', opts)
map("n", "<Leader>Y", '"+yg', opts)

map("v", "<Leader>p", '"+p', opts)
map("v", "<Leader>P", '"+P', opts)
map("n", "<Leader>p", '"+p', opts)
map("n", "<Leader>P", '"+P', opts)
