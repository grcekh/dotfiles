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
  vim.notify = require("notify")
end

Plugin.opts = {
  timeout = 3000,
  max_height = function()
    return math.floor(vim.o.lines * 0.75)
  end,
  max_width = function()
    return math.floor(vim.o.columns * 0.5)
  end,
}

return Plugin
