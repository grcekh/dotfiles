require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  ignore_install = {"beancount", "haskell"},
  highlight = {
    enable = true
  },
  indent = {
    enable = true,
    -- disable = {"typescript", "python"}
  }
})
