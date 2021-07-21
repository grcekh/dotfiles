----------------
-- KEYMAPPING --
----------------

local map = require("utils").map
local silent = { silent = true }

-- Set global and buffer leader key
vim.g.mapleader = "-"
vim.b.mapleader = "-"

-- Use jj instead of esc in insert mode
map("i", "jj", "<Esc>", silent)

-- FZF + ripgrep
-- map("n", "<C-f>", ":Files<CR>", silent)
-- map("n", "<C-g>", ":Rg<CR>", silent)

-- Window navigation
map("n", "<C-j>", "<C-W>j", silent)
map("n", "<C-k>", "<C-W>k", silent)
map("n", "<C-h>", "<C-W>h", silent)
map("n", "<C-l>", "<C-W>l", silent)

-- Copy and paste to system clipboard
map("v", "<Leader>y", '"+y', silent)
map("n", "<Leader>y", '"+y', silent)
map("n", "<Leader>Y", '"+yg', silent)

map("v", "<Leader>p", '"+p', silent)
map("v", "<Leader>P", '"+P', silent)
map("n", "<Leader>p", '"+p', silent)
map("n", "<Leader>P", '"+P', silent)
