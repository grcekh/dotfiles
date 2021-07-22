local map = require("utils").map

map("n", "<Leader>fb", [[<cmd>Telescope buffers show_all_buffers=true sort_lastused=true<cr>]], {silent = true})
map("n", "<Leader>fg", [[<cmd>Telescope git_files<cr>]], {silent = true})

map("n", "<C-f>", [[<cmd>Telescope find_files<cr>]], {silent = true})
map("n", "<C-g>", [[<cmd>Telescope live_grep<cr>]], {silent = true})

local actions = require("telescope.actions")

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default + actions.center,
      },
    },
    selection_strategy = "follow",
    layout_strategy = "horizontal",
    scroll_strategy = "cycle",
    layout_config = { 
      height = 0.65,
      horizontal = {
        preview_width = 0.5,
      },
    },
  },
})
