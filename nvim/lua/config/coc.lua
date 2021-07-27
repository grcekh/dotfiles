local t = require("utils").t

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, silent = true, expr = true }

-- If hidden is not set, TextEdit might fail
vim.o.hidden = true
-- Some servers have issues with backup files
vim.cmd([[
set nobackup
set nowritebackup
]])
-- Better display for messages
vim.o.cmdheight = 2
-- You will have bad experience for diagnostic messages when it's default 4000
vim.o.updatetime = 300
-- Don't give |ins-completion-menu| messages.
vim.cmd([[set shortmess+=c]])
-- Always show signcolumns
vim.o.signcolumn = "number"

vim.g.coc_global_extensions = {
  "coc-snippets",
  "coc-eslint",
  "coc-prettier",
  "coc-tsserver",
  "coc-json",
  "coc-emmet",
  "coc-styled-components",
}

-- Use tab for trigger completion with characters ahead and navigate.
-- Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
function _G.check_back_space()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match("%s")) and true
end

function _G.tab_completion()
  if vim.fn.pumvisible() == 1 then
    return t("<C-n>")
  else
    if check_back_space() then
      return t("<Tab>")
    else
      return vim.cmd(":call coc#refresh()")
    end
  end
end

map("i", "<Tab>", "v:lua.tab_completion()", expr_opts)

-- " Use <c-space> to trigger completion.
map("i", "<c-space>", ":call coc#refresh()", expr_opts)

-- Make <CR> auto-select the first completion item and notify coc.nvim to
-- format on enter, <cr> could be remapped by other vim plugin
function _G.select_first_completion()
  return vim.fn.pumvisible() == 1 and vim.cmd("coc#_select_confirm()") or vim.cmd([[\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>]])
end

-- " Use `[g` and `]g` to navigate diagnostics
-- nmap <silent> [g <Plug>(coc-diagnostic-prev)
-- nmap <silent> ]g <Plug>(coc-diagnostic-next)

-- " Remap keys for gotos
map("n", "gd", "<Plug>(coc-definition)", opts)
map("n", "gy", "<Plug>(coc-type-definition)", opts)
map("n", "gi", "<Plug>(coc-implementation)", opts)
map("n", "gr", "<Plug>(coc-references)", opts)

-- Prettier
vim.cmd([[
command! -nargs=0 Prettier :CocCommand prettier.formatFile
]])

-- Snippets
-- vim.cmd([[
-- inoremap <silent><expr> <TAB>
--        \ pumvisible() ? coc#_select_confirm() :
--        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
--        \ <SID>check_back_space() ? "\<TAB>" :
--        \ coc#refresh()
-- ]])

vim.g.coc_snippet_next = "<tab>"
