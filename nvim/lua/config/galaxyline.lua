local vim = vim
local gl = require("galaxyline")
local condition = require("galaxyline.condition")
local buffer = require("galaxyline.provider_buffer")
local my_icons = require("galaxyline.provider_fileinfo").define_file_icon()

local gls = gl.section

local gruvbox_material_modified_theme = {
  bg = "#292d34",
  bg_dim = "#333842",
  bg_light = "#444b59",
  black = "#222222",
  white = "#abb2bf",
  gray = "#868c96",
  red = "#ea6962",
  orange = "#e78a4e",
  yellow = "#d8a657",
  green = "#a9b665",
  aqua = "#89b482",
  blue = "#7daea3",
  purple = "#d3869b",
}

local everforest_theme = {
  bg = "#2b3339",
  bg_dim = "#3a454a",
  bg_light = "#4c555b",
  black = "#222222",
  white = "#c9d4cc",
  gray = "#9da9a0",
  red = "#e67e80",
  orange = "#e69875",
  yellow = "#dbbc7f",
  green = "#a7c080",
  aqua = "#83c092",
  blue = "#7fbbb3",
  purple = "#d699b6",
}

local colors = vim.g.colors_name == "everforest" and everforest_theme or gruvbox_material_modified_theme

gl.short_line_list = { "NvimTree", "term", "fugitive" }

my_icons["NvimTree"] = {colors.gray, ""}
my_icons["njk"] = {colors.gray, ""}

function mode_alias(m)
  local alias = {
    n = "NORMAL",
    i = "INSERT",
    c = "COMMAND",
    R = "REPLACE",
    t = "TERMINAL",
    [""] = "V-BLOCK",
    V = "V-LINE",
    v = "VISUAL",
  }

  return alias[m] or ""
end

function mode_color(m)
  local mode_colors = {
    normal = colors.green,
    insert = colors.blue,
    visual = colors.purple,
    replace = colors.red,
  }

  local color = {
    n = mode_colors.normal,
    i = mode_colors.insert,
    c = mode_colors.replace,
    R = mode_colors.replace,
    t = mode_colors.insert,
    [""] = mode_colors.visual,
    V = mode_colors.visual,
    v = mode_colors.visual,
  }

  return color[m] or colors.bg_light
end

local components = {
  ViMode = {
    separator_highlight = "GalaxyViModeReverse",
    highlight = {colors.bg, mode_color()},
    provider = function()
      local m = vim.fn.mode() or vim.fn.visualmode()
      local mode = mode_alias(m)
      local color = mode_color(m)
      vim.api.nvim_command("hi GalaxyViMode guibg=" .. color)
      vim.api.nvim_command("hi GalaxyViModeReverse guifg=" .. color)
      return "  " .. mode .. " "
    end,
  },
  ViModeIcon = {
    separator = "  ",
    separator_highlight = {colors.black, colors.bg_light},
    highlight = {colors.white, colors.black},
    provider = function() return "   " end,
  },

  -- File
  CWD = {
    separator = " ",
    separator_highlight = function()
      return {colors.bg_light, condition.buffer_not_empty() and colors.bg_dim or colors.bg}
    end,
    highlight = {colors.white, colors.bg_light},
    provider = function()
      local dirname = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      return "   " .. dirname .. " "
    end,
  },
  FileIcon = {
    icon = "  ",
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    highlight = {colors.gray, colors.bg_dim},
  },
  FileName = {
    provider = "FileName",
    condition = condition.buffer_not_empty,
    highlight = {colors.gray, colors.bg_dim},
    separator_highlight = {colors.bg_dim, colors.bg},
    separator = " ",
  },
  FileType = {
    separator = "  ",
    separator_highlight = {colors.bg_dim, colors.bg},
    highlight = {colors.gray, colors.bg_dim},
    provider = function()
      local buf = require("galaxyline.provider_buffer")
      return " " .. string.lower(buf.get_buffer_filetype()) .. " "
    end,
  },

  -- Git
  GitBranch = {
    icon = "  ", -- orange
    condition = condition.check_git_workspace,
    separator = " ",
    separator_highlight = {colors.bg_light, colors.bg_dim},
    highlight = {colors.white, colors.bg_light},
    provider = "GitBranch",
  },
  DiffAdd = {
    icon = "  ",
    provider = "DiffAdd",
    condition = condition.hide_in_width,
    highlight = {colors.white, colors.bg},
  },
  DiffModified = {
    icon = "  ",
    provider = "DiffModified",
    condition = condition.hide_in_width,
    highlight = {colors.gray, colors.bg},
  },
  DiffRemove = {
    icon = "  ",
    provider = "DiffRemove",
    condition = condition.hide_in_width,
    highlight = {colors.gray, colors.bg},
  },

  -- Coc
  CocStatus = {
    highlight = {colors.gray, colors.bg},
    provider = function()
      local status = vim.fn["coc#status"]()
      status = string.gsub(status, "❌", "")
      return " " .. status .. " "
    end,
  },
  CocFunction = {
    icon = "λ ",
    highlight = {colors.gray, colors.bg},
    provider = function()
      local has_func, func_name = pcall(vim.api.nvim_buf_get_var, 0, "coc_current_function")
      if not has_func then return "" end
      return func_name or ""
    end,
  },
  
  -- Line
  LinePercent = {
    condition = condition.buffer_not_empty,
    highlight = {colors.gray, colors.bg_dim},
    provider = "LinePercent"
  },
  LineColumn = {
    icon = "   ",
    condition = condition.buffer_not_empty,
    highlight = {colors.bg, mode_color()},
    separator_highlight = "GalaxyLineColumnReverse",
    provider = function()
      local line = vim.fn.line(".")
      local column = vim.fn.col(".")
      local m = vim.fn.mode() or vim.fn.visualmode()
      local mode = mode_alias(m)
      local color = mode_color(m)
      vim.api.nvim_command("hi GalaxyLineColumn guibg=" .. color)
      vim.api.nvim_command("hi GalaxyLineColumnReverse guifg=" .. color)
      return string.format("%1d:%1d", line, column) .. " "
    end,
  },

  -- Spacers
  GitSpacer = {
    condition = condition.check_git_workspace,
    highlight = {colors.gray, colors.bg_light},
    provider = function() return " " end
  },
  NotGitSpacer = {
    condition = function()
      return not condition.check_git_workspace()
    end,
    highlight = {colors.gray, colors.bg_dim},
    provider = function() return " " end
  },
  ShortLineSpacer = {
    highlight = {colors.gray, colors.bg},
    provider = function() return " " end
  },
}

-- vim.api.nvim_command([[
--   highlight! Statusline
--   highlight! StatuslineNC
-- ]])

-- Left

gls.left[1] = {ViMode = components.ViMode}
-- gls.left[2] = {CWD = components.CWD}
gls.left[2] = {FileIcon = components.FileIcon}
gls.left[3] = {FileName = components.FileName}
gls.left[4] = {DiffAdd = components.DiffAdd}
gls.left[5] = {DiffModified = components.DiffModified}
gls.left[6] = {DiffRemove = components.DiffRemove}
gls.left[7] = {CocStatus = components.CocStatus}
gls.left[8] = {CocFunction = components.CocFunction}

-- Right

gls.right[1] = {FileType = components.FileType}
gls.right[2] = {NotGitSpacer = components.NotGitSpacer}
gls.right[3] = {GitBranch = components.GitBranch}
gls.right[4] = {GitSpacer = components.GitSpacer}
-- gls.right[4] = {LinePercent = components.LinePercent}
gls.right[5] = {LineColumn = components.LineColumn}

-- Short line

gls.short_line_left[1] = {FileIcon = components.FileIcon}
gls.short_line_left[2] = {FileName = components.FileName}
gls.short_line_left[3] = {Shortlinespacer = components.Shortlinespacer}
gls.short_line_right[1] = {Shortlinespacer = components.Shortlinespacer}
