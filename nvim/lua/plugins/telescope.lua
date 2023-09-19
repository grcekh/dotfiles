local Plugin = { "nvim-telescope/telescope.nvim" }

Plugin.dependencies = {
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}

Plugin.tag = "0.1.2"

Plugin.cmd = "Telescope"

Plugin.keys = {
  {
    "<C-f>",
    function()
      require("telescope.builtin").find_files()
    end,
    desc = "Find files",
  },
  {
    "<C-g>",
    function()
      require("telescope.builtin").live_grep()
    end,
    desc = "Live grep",
  },
  {
    "<Leader>fb",
    function()
      require("telescope.builtin").buffers()
    end,
    desc = "List open buffers",
  },
}

Plugin.config = function()
  require("telescope").load_extension("fzf")
end

return Plugin
