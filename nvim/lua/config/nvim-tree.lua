-- TODO: Migrate
-- https://github.com/kyazdani42/nvim-tree.lua/issues/674

-- if not packer_plugins["nvim-tree.lua"].loaded then
  vim.cmd("packadd nvim-tree.lua")
  vim.cmd("packadd nvim-web-devicons")
-- end

local tree_action = require("nvim-tree.config").nvim_tree_callback
local map = require("utils").map
local g = vim.g

map("n", "<Leader>v", ":NvimTreeToggle<CR>", {silent = true})

require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  update_cwd = true,
  ignore_ft_on_setup = { "dashboard" },
  filters = {
    custom = { "^.git$", "node_modules", ".cache" },
    dotfiles = false,
  },
  git = {
    ignore = true
  },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
    },
  },
  hijack_directories = {
    auto_open = false,
  },
  update_focused_file = {
    enable = true,
  },
  renderer = {
    add_trailing = true,
    highlight_git = true,
    highlight_opened_files = "all",
    root_folder_modifier = ":t",
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "➜",
          untracked = "◌",
          -- deleted = "",
          -- deleted = "",
          deleted = "",
          ignored = "",
        },
        folder = {
          -- arrow_open = "",
          -- arrow_closed = "",
          -- default = "",
          -- default = "",
          default = "",
          -- open = "",
          open = "",
          -- empty = "",
          empty = "",
          -- empty_open = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        }
      },
    },
    indent_markers = {
      enable = false,
    },
  },
  view = {
    side = "left",
    width = 30,
    mappings = {
      list = {
        { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
        { key = { "<2-RightMouse>", "<C-}>" }, action = "cd" },
        { key = "w", action = "vsplit" },
        { key = "W", action = "split" },
        { key = "<C-t>", action = "tabnew" },
        { key = "<", action = "prev_sibling" },
        { key = ">", action = "next_sibling" },
        { key = "P", action = "parent_node" },
        { key = "<BS>", action = "close_node" },
        { key = "<S-CR>", action = "close_node" },
        { key = "<Tab>", action = "preview" },
        { key = "K", action = "first_sibling" },
        { key = "J", action = "last_sibling" },
        { key = "I", action = "toggle_ignored" },
        { key = "H", action = "toggle_dotfiles" },
        { key = "R", action = "refresh" },
        { key = "a", action = "create" },
        { key = "d", action = "remove" },
        { key = "r", action = "rename" },
        { key = "<C->", action = "full_rename" },
        { key = "x", action = "cut" },
        { key = "c", action = "copy" },
        { key = "p", action = "paste" },
        { key = "y", action = "copy_name" },
        { key = "Y", action = "copy_path" },
        { key = "gy", action = "copy_absolute_path" },
        { key = "[c", action = "prev_git_item" },
        { key = "}c", action = "next_git_item" },
        { key = "-", action = "dir_up" },
        { key = "q", action = "close" },
        { key = "g?", action = "toggle_help" },
      }
    }
  }
})
