local Plugin = { "akinsho/bufferline.nvim" }

Plugin.event = "VeryLazy"

Plugin.keys = {
  { "<A-,>", ":BufferLineCyclePrev<CR>", desc = "Cycle previous buffer" },
  { "<A-.>", ":BufferLineCycleNext<CR>", desc = "Cycle next buffer" },
  { "<A-c>", ":bdelete!<CR>", desc = "Delete current buffer" },
  {
    "<Leader>bp",
    "<Cmd>BufferLineTogglePin<CR>",
    desc = "Toggle pinned buffer",
  },
  {
    "<Leader>bP",
    "<Cmd>BufferLineGroupClose ungrouped<CR>",
    desc = "Delete non-pinned buffers",
  },
}

Plugin.opts = {
  options = {
    separator_style = "slant",
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = function()
          return vim.fn.getcwd()
        end,
        highlight = "Directory",
        text_align = "left",
      },
    },
  },
}

return Plugin
