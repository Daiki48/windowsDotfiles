local wezterm = require 'wezterm'
return {
  default_prog = { 'C:\\Program Files\\PowerShell\\7\\pwsh' },
  -- hide_tab_bar_if_only_one_tab = true,
  window_background_opacity = 0.8,
  window_padding = {
	  left = 0,
	  right = 0,
	  top = 0,
	  bottom = 0,
  },
  keys = {
    { key = 'C', mods = 'CTRL', action = wezterm.action.Copy },
    { key = 'v', mods = 'SHIFT|CTRL', action = wezterm.action.Paste },
  },
}