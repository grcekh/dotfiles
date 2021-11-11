require("nvim-treesitter.configs").setup({
  ensure_installed = "maintained",
  ignore_install = {"beancount", "bibtex", "cuda", "d", "devicetree", "dot", "haskell", "hcl", "heex", "rst", "tlaplus", "turtle", "verilog", "yang", "zig"},
  highlight = {
    enable = true
  },
  indent = {
    enable = false,
    -- disable = {"typescript", "python"}
  }
})
