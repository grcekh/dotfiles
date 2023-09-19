local Plugin = { "folke/todo-comments.nvim" }

Plugin.dependencies = {
  "nvim-lua/plenary.nvim",
}

Plugin.keys = {
  {
    "<Leader>tq",
    ":TodoQuickFix<CR>",
    desc = "Shows todos using quickfix list",
  },
  { "<Leader>tt", ":TodoTelescope<CR>", desc = "Search todos with Telescope" },
  {
    "]t",
    function()
      require("todo-comments").jump_next()
    end,
    desc = "Next todo comment",
  },
  {
    "[t",
    function()
      require("todo-comments").jump_prev()
    end,
    desc = "Previous todo comment",
  },
}

Plugin.opts = {}

return Plugin
