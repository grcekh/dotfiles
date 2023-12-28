local Plugin = { "folke/todo-comments.nvim" }

Plugin.dependencies = {
  "nvim-lua/plenary.nvim",
}

Plugin.event = "VeryLazy"

Plugin.config = function()
  vim.keymap.set(
    "n",
    "<Leader>tq",
    ":TodoQuickFix<CR>",
    { desc = "Shows todos using quickfix list" }
  )

  vim.keymap.set(
    "n",
    "<Leader>tt",
    ":TodoTelescope<CR>",
    { desc = "Search todos with Telescope" }
  )

  vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
  end, { desc = "Next todo comment" })

  vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
  end, { desc = "Previous todo comment" })
end

return Plugin
