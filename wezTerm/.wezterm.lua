local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'nightfox'
-- config.color_scheme = 'AdventureTime'

-- config.font = wezterm.font 'DejaVuSansM Nerd Font Mono'
config.font = wezterm.font 'FiraMono Nerd Font Mono'
config.font_size = 15.0

config.enable_tab_bar = false

return config
