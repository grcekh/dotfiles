local db = require("dashboard")
local map = require("utils").map

local home = os.getenv("HOME")

map("n", "<Leader>ss", ":<C-u>SessionSave<CR>", {noremap = false})
map("n", "<Leader>sl", ":<C-u>SessionLoad<CR>", {noremap = false})

db.custom_center = {
  {
    icon = "  ",
    desc = "Last session                            ",
    shortcut = "SPC s l",
    action ="SessionLoad"
  },
  {
    icon = "  ",
    desc = "Recently opened files                   ",
    action =  "Telescope oldfiles",
    shortcut = "SPC f h"
  },
  {
    icon = "  ",
    desc = "Find files                              ",
    action = "Telescope find_files find_command=rg,--hidden,--files",
    shortcut = "SPC f f"
  },
  {
    icon = "  ",
    desc ="File browser                            ",
    action =  "Telescope file_browser",
    shortcut = "SPC f b"
  },
  {
    icon = "  ",
    desc = "Open dotfiles                           ",
    action = "Telescope find_files path=" .. home .. "/dotfiles",
    shortcut = "SPC f d"
  },
}

db.custom_header = {
  "                                       ",
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
  "        v0.8.0-dev+236-gb70856009      ",
  "                                       ",
  "                                       ",
}

db.custom_footer = {
  "                                       ",
  "                                       ",
  "                     ▄                 ",
  "                    ███                ",
  "               ▄███████████▄           ",
  "               █████████████           ",
  "                                       ",
  "                                       ",
}
