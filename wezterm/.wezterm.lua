-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Gruvbox Dark (Gogh)"
config.window_background_opacity = 0.9
config.enable_tab_bar = false
config.window_padding = {
	left = 4,
	right = 4,
	top = 8,
	bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
