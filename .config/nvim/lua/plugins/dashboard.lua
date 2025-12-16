return {
  "glepnir/dashboard-nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  event = "VimEnter",

  opts = function()
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
  end,
}
