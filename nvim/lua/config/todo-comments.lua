local map = require("utils").map
local opts = { silent = true }

map("n", "<Leader>tq", ":TodoQuickFix<CR>", opts)
map("n", "<Leader>tt", ":TodoTelescope<CR>", opts)
