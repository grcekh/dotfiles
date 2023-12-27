local Plugin = { "folke/zen-mode.nvim" }

Plugin.event = "VeryLazy"

Plugin.opts = {
  backdrop = 0.96,
  width = 0.96,
  height = 1,
  plugins = {
    options = {
      -- Set `laststatus` to 3 to show statusline or 0 to hide statusline
      laststatus = 3,
    },
  },
}

return Plugin
