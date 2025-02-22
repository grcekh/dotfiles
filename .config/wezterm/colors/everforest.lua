local utils = require("utils")

local M = {}

M.name = "Everforest"

local themes = { "dark", "light" }
local backgrounds = { "hard", "medium", "soft" }
local default_theme = "dark"
local default_background = "hard"

--
-- Palette: https://github.com/sainnhe/everforest/blob/master/palette.md
--
-- bg0: Default, line numbers, signs
-- bg1: Cursor line, color columns, statusline, tabline
-- bg2: Popup menu, floating window, window toolbar
-- bg3: List chars, special keys
-- bg4: Window split separators, whitespace, breaks
-- bg5: Not currently used
-- bg_visual: Visual selection
-- bg_red: Diff deleted line, error highlights
-- bg_green: Diff added line, hint highlights
-- bg_blue: Diff changed line background, info highlights
-- bg_yellow: Warning highlights
--
-- grey0: Line numbers, fold columns, concealed text, foreground UI elements
-- grey1: Comments, punctuation delimiters, closed folds, ignored/disabled, UI borders, statusline text
-- grey2: Cursor line number
-- statusline1: Menu selection background, tab line label background (active), status line mode indicator
-- statusline2: Status line mode indicator
-- statusline3: Status line mode indicator

local background_hard = {
	dark = {
		bg_dim = "#1e2326",
		bg0 = "#272e33",
		bg1 = "#2e383c",
		bg2 = "#374145",
		bg3 = "#414b50",
		bg4 = "#495156",
		bg5 = "#4f5b58",
		bg_visual = "#4c3743",
		bg_red = "#493b40",
		bg_green = "#3c4841",
		bg_blue = "#384b55",
		bg_yellow = "#45443c",
	},
	light = {
		bg_dim = "#f2efdf",
		bg0 = "#fffbef",
		bg1 = "#f8f5e4",
		bg2 = "#f2efdf",
		bg3 = "#edeada",
		bg4 = "#e8e5d5",
		bg5 = "#bec5b2",
		bg_visual = "#f0f2d4",
		bg_red = "#ffe7de",
		bg_green = "#f3f5d9",
		bg_blue = "#ecf5ed",
		bg_yellow = "#fef2d5",
	},
}

local background_medium = {
	dark = {
		bg_dim = "#232a2e",
		bg0 = "#2d353b",
		bg1 = "#343f44",
		bg2 = "#3d484d",
		bg3 = "#475258",
		bg4 = "#4f585e",
		bg5 = "#56635f",
		bg_visual = "#543a48",
		bg_red = "#514045",
		bg_green = "#425047",
		bg_blue = "#3a515d",
		bg_yellow = "#4d4c43",
	},
	light = {
		bg_dim = "#efebd4",
		bg0 = "#fdf6e3",
		bg1 = "#f4f0d9",
		bg2 = "#efebd4",
		bg3 = "#e6e2cc",
		bg4 = "#e0dcc7",
		bg5 = "#bdc3af",
		bg_visual = "#eaedc8",
		bg_red = "#fbe3da",
		bg_green = "#f0f1d2",
		bg_blue = "#e9f0e9",
		bg_yellow = "#faedcd",
	},
}

local background_soft = {
	dark = {
		bg_dim = "#293136",
		bg0 = "#333c43",
		bg1 = "#3a464c",
		bg2 = "#434f55",
		bg3 = "#4d5960",
		bg4 = "#555f66",
		bg5 = "#5d6b66",
		bg_visual = "#5c3f4f",
		bg_red = "#59464c",
		bg_green = "#48584e",
		bg_blue = "#3f5865",
		bg_yellow = "#55544a",
	},
	light = {
		bg_dim = "#e5dfc5",
		bg0 = "#f3ead3",
		bg1 = "#eae4ca",
		bg2 = "#e5dfc5",
		bg3 = "#ddd8be",
		bg4 = "#d8d3ba",
		bg5 = "#b9c0ab",
		bg_visual = "#e1e4bd",
		bg_red = "#f4dbd0",
		bg_green = "#e5e6c5",
		bg_blue = "#e1e7dd",
		bg_yellow = "#f1e4c5",
	},
}

local foreground = {
	light = {
		fg = "#5c6a72",
		red = "#f85552",
		orange = "#f57d26",
		yellow = "#dfa000",
		green = "#8da101",
		aqua = "#35a77c",
		blue = "#3a94c5",
		purple = "#df69ba",
		grey0 = "#a6b0a0",
		grey1 = "#939f91",
		grey2 = "#829181",
		statusline1 = "#93b259",
		statusline2 = "#708089",
		statusline3 = "#e66868",
	},
	dark = {
		fg = "#d3c6aa",
		red = "#e67e80",
		orange = "#e69875",
		yellow = "#dbbc7f",
		green = "#a7c080",
		aqua = "#83c092",
		blue = "#7fbbb3",
		purple = "#d699b6",
		grey0 = "#7a8478",
		grey1 = "#859289",
		grey2 = "#9da9a0",
		statusline1 = "#a7c080",
		statusline2 = "#d3c6aa",
		statusline3 = "#e67e80",
	},
}

local function generate_palette_name(theme, background)
	return M.name .. " " .. theme:gsub("^%l", string.upper) .. " " .. background:gsub("^%l", string.upper)
end

local function generate_palette(theme, background)
	theme = theme or default_theme
	background = background or default_background

	local base_palette = foreground[theme]
	local background_palette

	if background == "soft" then
		background_palette = background_soft[theme]
	elseif background == "medium" then
		background_palette = background_medium[theme]
	else
		background_palette = background_hard[theme]
	end

	local combined_palette = utils.table_merge(base_palette, background_palette)

	return combined_palette
end

M.palettes = {}

for _, theme in ipairs(themes) do
	for _, background in ipairs(backgrounds) do
		local color_scheme_name = generate_palette_name(theme, background)
		M.palettes[color_scheme_name] = generate_palette(theme, background)
	end
end

M.palettes[M.name] = generate_palette(M.default_theme, M.default_variant)

return M
