local everforest = require("colors.everforest")
local utils = require("utils")

local M = {}

M.palettes = utils.table_merge(everforest.palettes)

M.color_schemes = {}

for name, palette in pairs(M.palettes) do
	M.color_schemes[name] = {
		foreground = palette.fg,
		background = palette.bg0,
		cursor_bg = palette.statusline1,
		cursor_fg = palette.bg0,
		cursor_border = palette.statusline3,
		selection_fg = palette.fg,
		selection_bg = palette.bg_visual,
		scrollbar_thumb = palette.fg,
		split = palette.bg4,
		ansi = {
			palette.bg5,
			palette.red,
			palette.green,
			palette.yellow,
			palette.blue,
			palette.purple,
			palette.aqua,
			palette.orange,
		},
		brights = {
			palette.bg5,
			palette.red,
			palette.green,
			palette.yellow,
			palette.blue,
			palette.purple,
			palette.aqua,
			palette.orange,
		},
		tab_bar = {
			background = palette.bg_dim,
			active_tab = {
				bg_color = palette.bg0,
				fg_color = palette.fg,
				intensity = "Normal",
				underline = "None",
				italic = false,
			},
			inactive_tab = {
				bg_color = palette.bg_dim,
				fg_color = palette.grey0,
			},
			inactive_tab_hover = {
				bg_color = palette.bg1,
				fg_color = palette.fg,
			},
			new_tab = {
				bg_color = palette.bg_dim,
				fg_color = palette.fg,
			},
			new_tab_hover = {
				bg_color = palette.bg1,
				fg_color = palette.fg,
			},
		},
	}
end

return M
