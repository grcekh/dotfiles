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

  -- Syntax highlighting
  { "tikhomirov/vim-glsl", ft = { "glsl" } },

  -- Git
  { "tpope/vim-fugitive", event = "VeryLazy" },
}
