local Plugin = { "folke/trouble.nvim" }

Plugin.dependencies = {
  "nvim-tree/nvim-web-devicons",
}

Plugin.keys = {
  {
    "<C-x>",
    function()
      require("trouble").open()
    end,
    desc = "Open Trouble",
  },
  {
    "<Leader>xw",
    function()
      require("trouble").open("workspace_diagnostics")
    end,
    desc = "Open workspace dianogstics from builtin LSP",
  },
  {
    "<Leader>xd",
    function()
      require("trouble").open("document_diagnostics")
    end,
    desc = "Open document dianogstics from builtin LSP",
  },
  {
    "<Leader>xq",
    function()
      require("trouble").open("quickfix")
    end,
    desc = "Open quickfix items",
  },
  {
    "<Leader>xl",
    function()
      require("trouble").open("loclist")
    end,
    desc = "Open items from the window's location list",
  },
  {
    "gR",
    function()
      require("trouble").open("lsp_references")
    end,
    desc = "Open references for current word from builtin LSP",
  },
}

return Plugin
