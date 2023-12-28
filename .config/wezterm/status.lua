local wezterm = require("wezterm")

local colors = require("colors")
local utils = require("utils")

local M = {}

local spacer = " "

local icons = {
	arrow_left = wezterm.nerdfonts.pl_left_hard_divider, -- 
	arrow_right = wezterm.nerdfonts.pl_right_hard_divider, -- 
	triangle_left = wezterm.nerdfonts.ple_lower_left_triangle, -- 
	triangle_right = wezterm.nerdfonts.ple_lower_right_triangle, -- 
	circle_left = wezterm.nerdfonts.ple_left_half_circle_thick, -- 
	circle_right = wezterm.nerdfonts.ple_right_half_circle_thick, -- 
	square = wezterm.nerdfonts.oct_square_fill, -- 
}

local default_separator = icons.triangle_right

local function create_status_component(args)
	args = args or {}

	local provider = args.provider or ""

	if provider == "" then
		return provider
	end

	local highlight = args.highlight or { fg = "white", bg = "black" }
	local icon = args.icon or ""
	local icon_highlight = args.icon_highlight or highlight
	local separator = args.separator or default_separator
	local separator_highlight = args.separator_highlight or highlight
	local separator_position = args.separator_position or "before"

	local component = {}

	local function add_segment(bg_color, fg_color, text)
		table.insert(component, { Background = { Color = bg_color } })
		table.insert(component, { Foreground = { Color = fg_color } })
		table.insert(component, { Text = text })
	end

	-- Add separator before, if specified
	if separator ~= "" and (separator_position == "before" or separator_position == "both") then
		add_segment(separator_highlight.bg, separator_highlight.fg, separator)
	end

	-- Add icon
	if icon ~= "" then
		add_segment(icon_highlight.bg, icon_highlight.fg, spacer .. icon)
	end

	-- Add provider
	add_segment(highlight.bg, highlight.fg, spacer .. provider .. spacer)

	-- Add separator after, if specified
	if separator ~= "" and (separator_position == "after" or separator_position == "both") then
		add_segment(separator_highlight.bg, separator_highlight.fg, separator)
	end

	return wezterm.format(component)
end

function M.setup(config)
	wezterm.on("update-status", function(window, pane)
		local color_scheme = window:effective_config().color_scheme
		local palette = colors.palettes[color_scheme]

		local status = window:active_workspace()
		local status_color = palette.statusline1

		if window:leader_is_active() then
			status = "leader"
			status_color = palette.purple
		end

		if window:active_key_table() then
			status = window:active_key_table()
			status_color = palette.blue
		end

		local cwd = pane:get_current_working_dir()
		cwd = cwd and utils.basename(cwd)

		local cmd = pane:get_foreground_process_name()
		cmd = cmd and utils.basename(cmd)

		local components = {
			Mode = create_status_component({
				provider = status,
				highlight = { fg = palette.bg_dim, bg = status_color },
				icon = wezterm.nerdfonts.oct_sparkle_fill,
				separator_highlight = { fg = palette.bg0, bg = status_color },
				separator_position = "after",
			}),
			Cwd = create_status_component({
				provider = cwd,
				highlight = { fg = palette.grey0, bg = palette.bg1 },
				icon = wezterm.nerdfonts.oct_file_directory_open_fill,
				separator_highlight = { fg = palette.bg1, bg = palette.bg_dim },
			}),
			Cmd = create_status_component({
				provider = cmd,
				highlight = { fg = palette.grey0, bg = palette.bg2 },
				icon = wezterm.nerdfonts.dev_terminal,
				separator_highlight = { fg = palette.bg2, bg = palette.bg1 },
			}),
			Time = create_status_component({
				provider = wezterm.strftime("%H:%M"),
				highlight = { fg = palette.grey0, bg = palette.bg3 },
				icon = wezterm.nerdfonts.md_clock,
				separator_highlight = { fg = palette.bg3, bg = palette.bg2 },
			}),
		}

		local left_status_components = table.concat({ components.Mode })
		window:set_left_status(left_status_components)

		local right_status_components = table.concat({ components.Cwd, components.Cmd, components.Time })
		window:set_right_status(right_status_components)
	end)
end

return M
