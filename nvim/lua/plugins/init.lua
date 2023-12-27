return {
  -- Colorschemes
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "hard"
      vim.cmd.colorscheme("everforest")
    end,
  },
  { "sainnhe/gruvbox-material", enabled = false },

  -- Git
  { "tpope/vim-fugitive", event = "VeryLazy" },

  -- Syntax highlighting
  { "tikhomirov/vim-glsl", ft = { "glsl" } },

  -- Quality of life
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    version = false,
    opts = {},
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    version = false,
    opts = {},
  },
  { "echasnovski/mini.pairs", event = "VeryLazy", version = false, opts = {} },
}
