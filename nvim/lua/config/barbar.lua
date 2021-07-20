local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent=true }

map("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
map("n", "<A->>", ":BufferMoveNext<CR>", opts)
map("n", "<A-c>", ":BufferClose<CR>", opts)

-- TODO
-- vim.g.bufferline = { {icons = "v:false"} }
