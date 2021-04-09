-----------------
-- KEY MAPPING --
-----------------

--[[
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

" Enter selects current popup menu item when visible
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
--]]

local opts = { noremap = true, silent=true }

-- jj instead of esc in insert mode
vim.api.nvim_set_keymap("i", "jj", "<Esc>", opts)

-- Toggle file manager
vim.api.nvim_set_keymap("n", "<Leader>t", ":CHADopen<CR>", opts)

-- FZF + ripgrep
vim.api.nvim_set_keymap("n", "<C-p>", ":FZF<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-f>", ":Files<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-g>", ":Rg<CR>", opts)

-- Window navigation
vim.api.nvim_set_keymap("n", "<C-j>", "<C-W>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-W>k", opts)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-W>h", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-W>l", opts)

