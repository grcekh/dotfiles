----------------
-- KEYMAPS --
----------------

local vim = vim

local opts = { silent = true }

-- Modes:
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

-- Set global and buffer leader key
vim.g.mapleader = "-"

-- Use jj instead of esc in insert mode
vim.keymap.set("i", "jj", "<Esc>", opts)

-- Window navigation
vim.keymap.set("n", "<C-j>", "<C-W>j", opts)
vim.keymap.set("n", "<C-k>", "<C-W>k", opts)
vim.keymap.set("n", "<C-h>", "<C-W>h", opts)
vim.keymap.set("n", "<C-l>", "<C-W>l", opts)

-- Copy and paste to system clipboard
vim.keymap.set("v", "<Leader>y", "\"+y", opts)
vim.keymap.set("n", "<Leader>y", "\"+y", opts)
vim.keymap.set("n", "<Leader>Y", "\"+yg", opts)

vim.keymap.set("v", "<Leader>p", "\"+p", opts)
vim.keymap.set("v", "<Leader>P", "\"+P", opts)
vim.keymap.set("n", "<Leader>p", "\"+p", opts)
vim.keymap.set("n", "<Leader>P", "\"+P", opts)
