local map = require("utils").map
local opts = {silent = true}

map("n", "<A-,>", ":BufferPrevious<CR>", opts)
map("n", "<A-.>", ":BufferNext<CR>", opts)
map("n", "<A-c>", ":BufferClose<CR>", opts)
