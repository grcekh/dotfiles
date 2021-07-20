----------------
-- KEYMAPPING --
----------------

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }


-- Set global and buffer leader key
vim.g.mapleader = "-"
vim.b.mapleader = "-"

-- Use jj instead of esc in insert mode
map("i", "jj", "<Esc>", opts)

-- Toggle file manager
map("n", "<Leader>t", ":CHADopen<CR>", opts)

-- FZF + ripgrep
map("n", "<C-p>", ":FZF<CR>", opts)
map("n", "<C-f>", ":Files<CR>", opts)
map("n", "<C-g>", ":Rg<CR>", opts)

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
