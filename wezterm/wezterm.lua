-------------------------------------------------------------------------------
--                          WezTerm Configuration
-------------------------------------------------------------------------------

local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-------------------------------------------------------------------------------
--                             General Config
-------------------------------------------------------------------------------
-- config.font = wezterm.font("IBMPlexMono-Regular")

config.font = wezterm.font("Dank Mono")

config.font_size = 15
config.line_height = 1

-- config.max_fps = 145
-- -- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "Tokyo Night"
-- config.color_scheme = "Tokyo Night Day"
config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.enable_scroll_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 1,
	bottom = 0,
}
-- config.window_background_opacity = 0.95
local root_name = "/home/badal/"
-- config.window_background_image = root_name .. ".dotfiles/screenshots/1.png"
config.window_background_image_hsb = {
	-- brightness = 0.12,
	-- saturation = 0.41,
}

config.text_background_opacity = 0.79

return config
