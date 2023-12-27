local Plugin = { "nvim-neorg/neorg" }

Plugin.dependencies = {
  "nvim-lua/plenary.nvim",
}

Plugin.build = ":Neorg sync-parsers"

Plugin.ft = { "norg" }

Plugin.config = function()
  require("neorg").setup({
    load = {
      ["core.defaults"] = {},
      ["core.journal"] = {
        config = {
          journal_folder = "20-calendar/logs",
        },
      },
      ["core.completion"] = { -- A wrapper to interface with several different completion engines.
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.concealer"] = {}, --  Enhances the basic Neorg experience by using icons instead of text.
      ["core.dirman"] = { --  Responsible for managing Neorg directories.
        config = {
          workspaces = {
            home = "~/pkm/neorg",
            personal = "~/pkm/neorg/04-spaces/personal",
            work = "~/pkm/neorg/04-spaces/work",
          },
          default_workspace = "home",
          index = "index.norg", -- The name of the root .norg file
        },
      },
      ["core.export"] = {}, --  Exports Neorg documents into any other supported filetype.
      ["core.export.markdown"] = {}, --  Interface for `core.export` to allow exporting to Markdown.
      ["core..manoeuvre"] = {}, -- Facilitates moving different elements up and down.
      ["core.presenter"] = { -- Creates presentation slides.
        config = {
          zen_mode = "zen-mode",
        },
      },
      ["core.summary"] = {}, -- Creates links to all files in any workspace.
      ["core.ui.calendar"] = {}, -- Opens an interactive calendar for date-related tasks.
    },
  })
end

return Plugin
