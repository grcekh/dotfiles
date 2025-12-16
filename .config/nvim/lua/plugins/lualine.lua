return {
  "nvim-lualine/lualine.nvim",

  event = "VeryLazy",

  opts = {
    sections = {
      lualine_x = {
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = { fg = "#ff9e64" },
        },
      },
    },
  },
}
