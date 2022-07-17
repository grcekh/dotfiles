-----------------
-- COLORSCHEME --
-----------------

local vim = vim

-- Global options
vim.o.termguicolors = true
vim.o.background = "dark"

-- Gruvbox Material (Modified)
vim.g.gruvbox_material_colors_override = {
  bg0 = { "#292d34", "234" },
  bg1 = { "#3f4451", "235" },
  bg2 = { "#292d34", "235" },
  bg3 = { "#3f4451", "237" },
  bg4 = { "#4c5161", "237" },
  bg5 = { "#7b7974", "239" },
  bg_statusline1 = { "#404451", "235" },
  bg_statusline2 = { "#404451", "235" },
  bg_statusline3 = { "#404451", "239" },
  bg_diff_green = { "#32361a", "22" },
  bg_visual_green = { "#333e34", "22" },
  bg_diff_red = { "#3c1f1e", "52" },
  bg_visual_red = { "#442e2d", "52" },
  bg_diff_blue = { "#0d3138", "17" },
  bg_visual_blue = { "#2e3b3b", "17" },
  bg_visual_yellow = { "#473c29", "94" },
  bg_current_word = { "#32302f", "236" },
  fg0 = { "#d1ccc2", "223" },
  fg1 = { "#d1ccc2", "223" },
  red = { "#ea6962", "167" },
  orange = { "#e78a4e", "208" },
  yellow = { "#d8a657", "214" },
  green = { "#a9b665", "142" },
  aqua = { "#89b482", "108" },
  blue = { "#7daea3", "109" },
  purple = { "#d3869b", "175" },
  bg_red = { "#ea6962", "167" },
  bg_green = { "#a9b665", "142" },
  bg_yellow = { "#d8a657", "214" },
  grey0 = { "#7b7974", "243" },
  grey1 = { "#99958d", "245" },
  grey2 = { "#acb2be", "246" },
  none = { "NONE", "NONE" },
}

-- Everforest
vim.g.everforest_background = "hard"

-- Set colorscheme
vim.cmd("colorscheme everforest")
