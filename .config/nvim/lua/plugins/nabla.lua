local Plugin = { "jbyuki/nabla.nvim" }

Plugin.init = function()
  vim.keymap.set("n", "<Leader>n", function()
    require("nabla").toggle_virt()
  end)

  vim.keymap.set("n", "<Leader>N", function()
    require("nabla").popup()
  end)
end

return Plugin
