local map = require("utils").map

map("n", "<Leader>tq", ":TodoQuickFix<CR>", {silent = true})
map("n", "<Leader>tt", ":TodoTelescope<CR>", {silent = true})
