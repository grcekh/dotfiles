local wezterm = require("wezterm")

local act = wezterm.action
local mux = wezterm.mux

local M = {}

function M.setup(config)
	config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

	config.keys = {
		-- Send C-a when inputting C-a twice
		{ key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
		{ key = "r", mods = "CTRL|SHIFT|SUPER", action = act.ReloadConfiguration },

		-- Modes
		{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
		{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
		{ key = "m", mods = "LEADER", action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) },

		-- Session manager
		{ key = "S", mods = "SUPER", action = act({ EmitEvent = "save_session" }) },
		{ key = "L", mods = "SUPER", action = act({ EmitEvent = "load_session" }) },
		{ key = "R", mods = "SUPER", action = act({ EmitEvent = "restore_session" }) },

		-- Workspaces
		{ key = "f", mods = "CTRL|SHIFT", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
		{ key = "y", mods = "CTRL|SHIFT", action = act.SwitchToWorkspace({ name = "home" }) },
		{ key = "n", mods = "CTRL", action = act.SwitchWorkspaceRelative(1) },
		{ key = "p", mods = "CTRL", action = act.SwitchWorkspaceRelative(-1) },
		{
			key = "u",
			mods = "CTRL|SHIFT",
			action = act.SwitchToWorkspace({ name = "monitoring", spawn = { args = { "top" } } }),
		},
		{
			key = "w",
			mods = "LEADER",
			action = act.PromptInputLine({
				description = "Enter a name to create a new workspace:",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:perform_action(act.SwitchToWorkspace({ name = line }), pane)
					end
				end),
			}),
		},
		{
			key = "r",
			mods = "CTRL|SHIFT",
			action = act.PromptInputLine({
				description = "Rename the current workspace:",
				action = wezterm.action_callback(function(_, _, line)
					if line then
						local active_workspace = mux.get_active_workspace()
						if active_workspace ~= "home" then
							mux.rename_workspace(active_workspace, line)
						end
					end
				end),
			}),
		},

		-- Panes
		{ key = "s", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "SHIFT|SUPER", action = act.ActivatePaneDirection("Left") },
		{ key = "l", mods = "SHIFT|SUPER", action = act.ActivatePaneDirection("Right") },
		{ key = "k", mods = "SHIFT|SUPER", action = act.ActivatePaneDirection("Up") },
		{ key = "j", mods = "SHIFT|SUPER", action = act.ActivatePaneDirection("Down") },
		{ key = "z", mods = "SHIFT|SUPER", action = act.TogglePaneZoomState },
		{ key = "o", mods = "SHIFT|SUPER", action = act.RotatePanes("Clockwise") },
		{ key = "w", mods = "SUPER", action = act.CloseCurrentPane({ confirm = true }) },

		-- Tabs
		{ key = "w", mods = "SHIFT|SUPER", action = act.CloseCurrentTab({ confirm = true }) },
		{ key = "t", mods = "CMD|SHIFT", action = act.ShowTabNavigator },
		{
			key = "r",
			mods = "CMD|SHIFT",
			action = act.PromptInputLine({
				description = "Rename the current tab:",
				action = wezterm.action_callback(function(window, _, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
	}

	-- Move the current tab to the index specified by the argument
	for i = 1, 9 do
		table.insert(config.keys, {
			key = tostring(i),
			mods = "LEADER",
			action = act.MoveTab(i - 1),
		})
	end

	-- Key tables for different modes, which correspond to the names specified in
	-- the `ActivateKeyTable` key assignments above.
	config.key_tables = {
		resize_pane = {
			{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
			{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
			{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
			{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
			{ key = "Escape", action = "PopKeyTable" },
			{ key = "Enter", action = "PopKeyTable" },
		},
		move_tab = {
			{ key = "h", action = act.MoveTabRelative(-1) },
			{ key = "j", action = act.MoveTabRelative(-1) },
			{ key = "k", action = act.MoveTabRelative(1) },
			{ key = "l", action = act.MoveTabRelative(1) },
			{ key = "Escape", action = "PopKeyTable" },
			{ key = "Enter", action = "PopKeyTable" },
		},
	}
end

return M
