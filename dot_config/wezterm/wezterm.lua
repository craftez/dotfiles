local wezterm = require("wezterm")

--kanagawa
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "kanagawabones"
config.font = wezterm.font("MonoLisa")
config.font_size = 16
config.line_height = 1.2
config.cell_width = 0.9
config.use_fancy_tab_bar = true
config.force_reverse_video_cursor = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 32
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.6
config.macos_window_background_blur = 20
config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}

-- config.disable_default_key_bindings = true

local a = wezterm.action

config.keys = {
	{
		key = "h",
		mods = "CTRL",
		action = a.ActivateCopyMode,
	},
	{
		key = "k",
		mods = "CMD",
		action = a.ClearScrollback("ScrollbackAndViewport"),
	},
	{
		key = "Enter",
		mods = "CMD",
		action = a.SplitHorizontal,
	},
	{
		key = "Enter",
		mods = "CMD|SHIFT",
		action = a.SplitVertical,
	},
	{
		key = "UpArrow",
		mods = "CMD",
		action = a.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "CMD",
		action = a.ActivatePaneDirection("Down"),
	},
	{
		key = "LeftArrow",
		mods = "CMD",
		action = a.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = a.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "CMD|SHIFT",
		action = a.AdjustPaneSize({ "Up", 1 }),
	},
	{
		key = "DownArrow",
		mods = "CMD|SHIFT",
		action = a.AdjustPaneSize({ "Down", 1 }),
	},
	{
		key = "LeftArrow",
		mods = "CMD|SHIFT",
		action = a.AdjustPaneSize({ "Left", 1 }),
	},
	{
		key = "RightArrow",
		mods = "CMD|SHIFT",
		action = a.AdjustPaneSize({ "Right", 1 }),
	},
	{
		key = "^",
		mods = "CTRL|SHIFT",
		action = a.DisableDefaultAssignment,
	},
}

return config
