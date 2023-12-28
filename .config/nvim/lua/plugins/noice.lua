local Plugin = { "folke/noice.nvim" }

Plugin.dependencies = {
  "MunifTanjim/nui.nvim",
  "rcarriga/nvim-notify",
}

Plugin.event = "VeryLazy"

Plugin.opts = {
  lsp = {
    -- Override markdown rendering so that cmp and other plugins use Treesitter
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  cmdline = {
    format = {
      cmdline = { icon = ">" },
      search_down = { icon = "[↓] /" },
      search_up = { icon = "[↑] /" },
    },
  },
  format = {
    level = {
      icons = {
        error = "✖",
        warn = "▼",
        info = "●",
      },
    },
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        any = {
          { find = "%d+L, %d+B" },
          { find = "; after #%d+" },
          { find = "; before #%d+" },
        },
      },
      view = "mini",
    },
  },
  views = {
    mini = {
      win_options = {
        winblend = 100,
      },
    },
  },
  presets = {
    bottom_search = true, -- Use bottom cmdline for search
    command_palette = false, -- Position the cmdline and popupmenu together
    long_message_to_split = true, -- Long messages will be sent to a split
    inc_rename = false, -- Enables an input dialog for inc-rename.nvim
    lsp_doc_border = true,
  },
}

return Plugin
