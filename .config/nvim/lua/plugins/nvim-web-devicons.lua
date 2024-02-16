local Plugin = { "nvim-tree/nvim-web-devicons" }

Plugin.lazy = true

Plugin.opts = {
  override = {
    astro = {
      icon = "",
      color = "#b845ed",
      name = "astro",
    },
    norg = {
      icon = "",
      color = "#4878be",
      name = "neorg",
    },
  },
}

return Plugin
