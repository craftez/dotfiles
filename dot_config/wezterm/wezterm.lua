local colors = require("colors.bearded-gale").colors
local keys = require("mappings").keys
local utils = require("utils")
local wezterm = require("wezterm")

local config = {
	audible_bell = "Disabled",
	inactive_pane_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.0,
	},
	-- Theming
	colors = colors,
	color_scheme = "Bearded-gale",
	font = wezterm.font_with_fallback({ "JetBrainsMono NF", "Hack Nerd Font" }),
	font_size = 14,
	line_height = 1.1,
	window_background_opacity = 0.93,
	window_padding = {
		left = "10px",
		right = "7px",
		top = "10px",
		bottom = "0px",
	},
	leader = { key = "a", mods = "CTRL" },
	disable_default_key_bindings = true,
	-- Keys setup
	keys = keys,
	-- Functionalities
	enable_scroll_bar = true,
	enable_tab_bar = false,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = false,
	launch_menu = {},
	min_scroll_bar_height = "0.5cell",
	scrollback_lines = 50000,
}

utils.listenerZenMode()

return config
