return {
  "folke/todo-comments.nvim",

  dependencies = { "nvim-lua/plenary.nvim" },

  event = "VeryLazy",

  cmd = { "TodoTelescope", "TodoQuickFix" },

  opts = {},

  keys = {
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Next Todo Comment",
    },
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Previous Todo Comment",
    },
    { "<leader>tq", "<cmd>TodoQuickFix<cr>", desc = "Todo (Quickfix)" },
    { "<leader>tt", "<cmd>TodoTelescope<cr>", desc = "Todo (Telescope)" },
  },
}
