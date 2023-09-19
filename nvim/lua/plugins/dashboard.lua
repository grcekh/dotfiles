local Plugin = { "glepnir/dashboard-nvim" }

Plugin.dependencies = {
  "nvim-tree/nvim-web-devicons",
}

Plugin.event = "VimEnter"

Plugin.opts = function()
  local home = os.getenv("HOME")
  local ver = "v"
    .. vim.version().major
    .. "."
    .. vim.version().minor
    .. "."
    .. vim.version().patch

  return {
    theme = "doom",
    config = {
      header = {
        "                                       ",
        "                  ▀▄   ▄▀              ",
        "                 ▄█▀███▀█▄             ",
        "                █▀███████▀█            ",
        "                █ █▀▀▀▀▀█ █            ",
        "                   ▀▀ ▀▀               ",
        "                                       ",
        "                ▄ ▀▄   ▄▀ ▄            ",
        "                █▄███████▄█            ",
        "                ███▄███▄███            ",
        "                ▀█████████▀            ",
        "                 ▄▀     ▀▄             ",
        "                                       ",
        "                                       ",
        "                                       ",
        "         █▄ █ █▀▀ █▀█ █ █ █ █▀▄▀█      ",
        "         █ ▀█ ██▄ █▄█ ▀▄▀ █ █ ▀ █      ",
        "                                       ",
        "                     " .. ver .. "                  ",
        "                                       ",
      },

      center = {
        {
          icon = "  ",
          desc = "Last session                            ",
          action = "SessionLoad",
        },
        {
          icon = "󰈢  ",
          desc = "Recently opened files                   ",
          action = "Telescope oldfiles",
        },
        {
          icon = "  ",
          desc = "Find files                              ",
          action = "Telescope fd",
        },
        {
          icon = "  ",
          desc = "Open dotfiles                           ",
          action = "Telescope find_files path=" .. home .. "/dotfiles",
        },
      },

      footer = {
        "                                       ",
        "                     ▄                 ",
        "                    ███                ",
        "               ▄███████████▄           ",
        "               █████████████           ",
        "                                       ",
      },
    },
  }
end

return Plugin
