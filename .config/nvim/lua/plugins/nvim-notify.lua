local Plugin = { "rcarriga/nvim-notify" }

Plugin.event = "VeryLazy"

Plugin.keys = {
  {
    "<Leader>un",
    function()
      require("notify").dismiss({ silent = true, pending = true })
    end,
    desc = "Dismiss all notifications",
  },
}

Plugin.config = function()
  vim.notify = require("notify").setup()
end

Plugin.opts = {
  background_colour = "#000000",
  timeout = 1000,
  max_height = function()
    return math.floor(vim.o.lines * 0.75)
  end,
  max_width = function()
    return math.floor(vim.o.columns * 0.5)
  end,
  on_open = function(win)
    vim.api.nvim_win_set_config(win, { zindex = 100 })
  end,
}

return Plugin
