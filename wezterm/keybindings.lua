local wezterm = require("wezterm")
local act = wezterm.action

local keymaps = {}

local function apply_to_config(config)
	config.keys = {
		--
		{ key = "j", mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "k", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
		{ key = "k", mods = "ALT", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "j", mods = "ALT", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "h", mods = "ALT", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "l", mods = "ALT", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "p", mods = "CTRL", action = act.PaneSelect({ mode = "SwapWithActive", alphabet = "mnbvc" }) },
		{ key = "r", mods = "CTRL|SHIFT", action = act.RotatePanes("Clockwise") },
	}
end

keymaps.apply_to_config = apply_to_config

return keymaps
