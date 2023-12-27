local Plugin = { "nvim-tree/nvim-web-devicons" }

Plugin.lazy = true

Plugin.opts = {
  override = {
    norg = {
      icon = "",
      color = "#4878be",
      name = "neorg",
    },
  },
}

return Plugin
