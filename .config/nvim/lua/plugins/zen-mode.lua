return {
  "folke/zen-mode.nvim",

  event = "VeryLazy",

  opts = {
    backdrop = 0.96,
    width = 0.96,
    height = 1,
    plugins = {
      options = {
        -- Set `laststatus` to 3 to show statusline or 0 to hide statusline
        laststatus = 3,
      },
    },
  },
}
