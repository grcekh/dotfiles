local Plugin = { "lervag/vimtex" }

Plugin.lazy = false

Plugin.init = function()
  vim.g.vimtex_view_method = "sioyek"
  vim.g.vimtex_syntax_enabled = 0
end

return Plugin
