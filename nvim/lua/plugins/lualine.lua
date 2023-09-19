local Plugin = { "nvim-lualine/lualine.nvim" }

Plugin.event = "VeryLazy"

Plugin.opts = {
  sections = {
    lualine_x = {
      {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
        color = { fg = "#ff9e64" },
      },
    },
  },
}

return Plugin
