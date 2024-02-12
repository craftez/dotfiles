local wezterm = require("wezterm")
local act = wezterm.action

local mod = {}

local keys = {
  -- panes --
  -- panes: split panes
  {
    key = [[_]],
    mods = "CTRL|SHIFT",
    action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = [[|]],
    mods = "CTRL|SHIFT",
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
}

local mouse_bindings = {
  -- Ctrl-click will open the link under the mouse cursor
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = act.OpenLinkAtMouseCursor,
  },
}

return {
  disable_default_key_bindings = false,
  -- leader = { key = "a", mods = "CTRL" },
  keys = keys,
  key_tables = key_tables,
  mouse_bindings = mouse_bindings,
}
