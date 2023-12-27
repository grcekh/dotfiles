local Plugin = { "xiyaowong/transparent.nvim" }

Plugin.enabled = false

Plugin.lazy = false

Plugin.init = function()
  local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
  local background = normal_hl
      and normal_hl.background
      and string.format("#%06x", normal_hl.background)
    or "#000000"

  require("notify").setup({
    background_colour = background,
  })
end

Plugin.opts = {
  extra_groups = { "Normal", "NvimTreeNormal", "NvimTreeEndOfBuffer" },
  exclude_groups = { "CursorLine", "CursorLineNr" },
}

return Plugin
