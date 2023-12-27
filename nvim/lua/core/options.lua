-------------
-- OPTIONS --
-------------

local vim = vim

local opts = {
  autoindent = true, -- Automatically set the indent of a new line
  background = "dark", -- Set background to dark theme
  backspace = [[indent,eol,start]], -- Make backspace work
  cindent = true, -- Enable C-style indentation
  -- clipboard = "unnamedplus", -- Sync with system clipboard
  completeopt = "menu,menuone,noselect", -- Required by nvim-cmp
  confirm = true, -- Confirm to save chagnes before exiting modified buffer
  cursorline = true, -- Highlight the cursor line
  expandtab = true, -- Convert tabs to spaces
  fillchars = { eob = "·" }, -- Replace '~' in empty lines at the end of a buffer
  hlsearch = true, -- Highlight search results
  history = 500, -- Store up to 500 lines of command line history
  ignorecase = true, -- Ignore case when searching
  incsearch = true, -- Incremental search
  laststatus = 2, -- Always display the status line
  linebreak = true, -- When wrap is enabled, break lines at words
  mouse = "a", -- Enable mouse support
  number = true, -- Show line numbers
  relativenumber = true, -- Show line numbers relative to the cursor line
  ruler = true, -- Display the cursor position in the status line
  shiftwidth = 0, -- Set the number of spaces per indent
  showmatch = true, -- Show matching parenthesis
  showmode = false, -- Hide the mode indicator in favor of custom statusline
  signcolumn = "yes", -- Always show the sign column
  smartcase = true, -- Enable case-sensitive search when caps are used
  smartindent = true, -- Enable smart indentation
  spelllang = { "en_us", "cjk" }, -- Languages to spellcheck for when the 'spell' option is on
  splitbelow = true, -- Split new windows below the current one
  splitright = true, -- Split new windows to the right of the current one
  tabstop = 2, -- Number of spaces in a tab
  termguicolors = true, -- Enable true color support
  undofile = true, -- Enable persistment undo
  undolevels = 10000, -- Set the number of changes that can be undone
  updatetime = 200, -- Set the time (in ms) to trigger CursorHold event
  wrap = true, -- Enable line wrapping
}

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = "screen"
  vim.opt.shortmess:append({ C = true })
end

for k, v in pairs(opts) do
  vim.opt[k] = v
end
