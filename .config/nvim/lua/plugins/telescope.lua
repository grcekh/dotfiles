return {
  "nvim-telescope/telescope.nvim",

  tag = "v0.2.0",

  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  config = function()
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
  end,
}
