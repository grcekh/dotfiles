local wezterm = require("wezterm")

local session_manager = require("session-manager")
local colors = require("colors")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
	config:set_strict_mode(true)
end

require("keys").setup(config)
require("status").setup(config)

-- Settings
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.default_workspace = "home"
config.scrollback_lines = 3000
config.use_dead_keys = false

config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- Font rendering
config.freetype_load_flags = "NO_HINTING"
config.freetype_load_target = "Light"
config.font = wezterm.font_with_fallback({
	{ family = "SF Mono", weight = "Medium" },
	"Hack Nerd Font",
	"icomoon",
})

config.underline_thickness = 2
config.underline_position = -4

-- Colors
config.color_scheme = "Everforest Dark Hard"
config.color_schemes = colors.color_schemes
config.bold_brightens_ansi_colors = false

-- Window
config.adjust_window_size_when_changing_font_size = false
config.window_close_confirmation = "AlwaysPrompt"
config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.macos_window_background_blur = 0
config.window_padding = {
	left = "2cell",
	right = "2cell",
	top = "1cell",
	bottom = "1cell",
}

-- Tab bar
config.tab_max_width = 32
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Panes
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.9,
}

-- Session manager
wezterm.on("save_session", function(window)
	session_manager.save_state(window)
end)
wezterm.on("load_session", function(window)
	session_manager.load_state(window)
end)
wezterm.on("restore_session", function(window)
	session_manager.restore_state(window)
end)

return config
