require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          vimwiki = "~/pkm/vimwiki/personal",
          work = "~/pkm/vimwiki/work",
          home = "~/pkm/neorg",
        }
      }
    }
  }
})
