local map = require("utils").map

map("n", "<Leader>ss", ":<C-u>SessionSave<CR>", {noremap = false})
map("n", "<Leader>sl", ":<C-u>SessionLoad<CR>", {noremap = false})

vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_header = {
  "    ▄   ▄███▄   ████▄     ▄   ▄█ █▀▄▀█ ",
  "     █  █▀   ▀  █   █      █  ██ █ █ █ ",
  " ██   █ ██▄▄    █   █ █     █ ██ █ █ █ ",
  " █ █  █ █▄   ▄▀ ▀████  █    █ ▐█ █   █ ",
  " █  █ █ ▀███▀           █  █   ▐    █  ",
  " █   ██                  █▐        ▀   ",
  "                        ▐              ",
}

vim.g.dashboard_custom_header = {
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
  "                v0.6.0-beta            ",
  "                                       ",
  "                                       ",
}

vim.g.dashboard_custom_footer = {
  "                                       ",
  "                                       ",
  "                     ▄                 ",
  "                    ███                ",
  "               ▄███████████▄           ",
  "               █████████████           ",
  "                                       ",
  "                                       ",
}