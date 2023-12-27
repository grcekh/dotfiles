local Plugin = { "nvim-telescope/telescope.nvim" }

Plugin.dependencies = {
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}

Plugin.tag = "0.1.5"

Plugin.config = function()
  vim.keymap.set("n", "<C-f>", function()
    require("telescope.builtin").find_files()
  end, { desc = "Find files" })

  vim.keymap.set("n", "<C-g>", function()
    require("telescope.builtin").live_grep()
  end, { desc = "Live grep" })

  vim.keymap.set("n", "<Leader>fb", function()
    require("telescope.builtin").buffers()
  end, { desc = "List open buffers" })

  require("telescope").load_extension("fzf")
end

return Plugin
