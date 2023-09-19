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
  "sainnhe/gruvbox-material",

  -- Git
  "tpope/vim-fugitive",

  -- Syntax
  { "echasnovski/mini.surround", version = false, opts = {} },
  { "echasnovski/mini.comment", version = false, opts = {} },
  { "echasnovski/mini.pairs", version = false, opts = {} },
  { "NvChad/nvim-colorizer.lua", opts = {} },
}
