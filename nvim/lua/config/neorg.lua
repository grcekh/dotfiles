require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          main = "~/pkm/neorg",
          gtd = "~/pkm/neorg/gtd",
        }
      }
    },
    ["core.export"] = {},
    ["core.norg.journal"] = {
      config = {
        workspace = "main",
      }
    },
    ["core.norg.manoeuvre"] = {},
    ["core.norg.concealer"] = {},
    ["core.norg.qol.toc"] = {},
    ["core.gtd.base"] = {
      config = {
        workspace = "gtd",
      }
    },
  }
})
