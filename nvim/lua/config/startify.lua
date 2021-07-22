vim.g.startify_custom_header = {
	'   ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
	'   ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
	'   ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
	'   ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
	'   ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
	'   ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}
-- vim.g.startify_custom_header = {}
vim.g.startify_bookmarks = {
  {v = "~/.config/nvim/init.vim"},
  {l = "~/.config/nvim/init.lua"},
}
vim.g.startify_lists = {
  {type = "bookmarks", header = {"   Bookmarks"} },
  {type = "files",     header = {"   Recent Files"} },
  {type = "dir",       header = {"   Recent Files in " .. vim.fn.getcwd()} },
}
vim.g.startify_files_number = 5

-- Load on startup
vim.cmd([[
augroup startup
   autocmd!
   autocmd VimEnter * Startify
   autocmd VimEnter * CHADopen --nofocus
augroup END
]])
