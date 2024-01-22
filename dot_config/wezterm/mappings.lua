local wezterm = require("wezterm")
local wact = wezterm.action
local M = {}

M.keys = {
	-- Pane related keys
	{ key = "\\", mods = "ALT", action = wact.SplitHorizontal({}) },
	{ key = "-", mods = "ALT", action = wact.SplitVertical({}) },
	{ key = "h", mods = "CTRL", action = wact.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CTRL", action = wact.ActivatePaneDirection("Right") },
	{ key = "k", mods = "CTRL", action = wact.ActivatePaneDirection("Up") },
	{ key = "j", mods = "CTRL", action = wact.ActivatePaneDirection("Down") },
	-- { key = "h", mods = "CTRL|ALT", action = wact.AdjustPaneSize({ "Left", 1 }) },
	-- { key = "j", mods = "CTRL|ALT", action = wact.AdjustPaneSize({ "Down", 1 }) },
	-- { key = "k", mods = "CTRL|ALT", action = wact.AdjustPaneSize({ "Up", 1 }) },
	-- { key = "l", mods = "CTRL|ALT", action = wact.AdjustPaneSize({ "Right", 1 }) },
	{ key = "c", mods = "CTRL", action = wact.CloseCurrentPane({ confirm = true }) },
	-- Tab related keys
	{ key = "c", mods = "CTRL|ALT", action = wact.CloseCurrentTab({ confirm = true }) },
	{ key = "t", mods = "CTRL", action = wact.SpawnTab("CurrentPaneDomain") },
	-- Tab navigation
	{ key = "1", mods = "CTRL", action = wact.ActivateTab(0) },
	{ key = "2", mods = "CTRL", action = wact.ActivateTab(1) },
	{ key = "3", mods = "CTRL", action = wact.ActivateTab(2) },
	{ key = "4", mods = "CTRL", action = wact.ActivateTab(3) },
	{ key = "5", mods = "CTRL", action = wact.ActivateTab(4) },
	{ key = "6", mods = "CTRL", action = wact.ActivateTab(5) },
	{ key = "7", mods = "CTRL", action = wact.ActivateTab(6) },
	{ key = "8", mods = "CTRL", action = wact.ActivateTab(7) },
	-- { key = "h", mods = "CTRL|SHIFT", action = wact.ActivateTabRelative(-1) },
	-- { key = "l", mods = "CTRL|SHIFT", action = wact.ActivateTabRelative(1) },
	-- Miscelaneous
	{ key = "F11", action = wact.ToggleFullScreen },
	{ key = "+", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
	-- Utilities
	-- { key = "c", mods = "CTRL", action = wact.CopyTo("Clipboard") },
	-- { key = "v", mods = "CTRL", action = wact.PasteFrom("Clipboard") },
	-- Debugging and core functionality
	-- { key = "d", mods = "CTRL|ALT|SHIFT", action = wact.ShowDebugOverlay },
	-- { key = "p", mods = "CTRL|SHIFT", action = wact.ActivateCommandPalette },
}

return M
