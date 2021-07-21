local map = require("utils").map
local opts = { noremap = true, silent = true }

map("n", "<A-,>", ":BufferPrevious<CR>", {silent = true})
map("n", "<A-.>", ":BufferNext<CR>", {silent = true})
map("n", "<A-c>", ":BufferClose<CR>", {silent = true})
