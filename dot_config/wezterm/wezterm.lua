local wezterm = require "wezterm"
local config = {}

-- Disable Top Bar
config.enable_tab_bar = false

-- Font
config.font = wezterm.font "FiraCode Nerd Font Mono"

-- Color Scheme
config.color_scheme = "Catppuccin Mocha"

-- Cursor Style
config.default_cursor_style = "SteadyBar"

return config
