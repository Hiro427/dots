local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- local keymaps = require("keybindings")
-- keymaps.apply_to_config(config)

config.term = "xterm-256color"
config.font_size = 12
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.initial_rows = 30
config.initial_cols = 100
config.enable_tab_bar = false
config.enable_kitty_graphics = true
config.window_close_confirmation = "NeverPrompt"
config.enable_wayland = false

if os.getenv("XDG_CURRENT_DESKTOP") == "i3" then
	config.window_decorations = "RESIZE"
else
	config.window_decorations = "NONE"
end

config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.default_cursor_style = "BlinkingBar"
config.window_background_opacity = 1
config.color_scheme = "Catppuccin Mocha"
config.pane_select_font_size = 24

-- config.webgpu_preferred_adapter = {
-- 	backend = "Vulkan",
-- 	device = 9632,
-- 	device_type = "DiscreteGpu",
-- 	driver = "NVIDIA",
-- 	driver_info = "565.77",
-- 	name = "NVIDIA GeForce RTX 3050 Ti Laptop GPU",
-- 	vendor = 4318,
-- }
-- config.front_end = "WebGpu"
--
-- config.webgpu_force_fallback_adapter = true

-- File = "/home/jacobrambarran/wallpapers/cat-vibin.png"
-- config.window_background_image = File
-- config.window_background_image_hsb = {
-- 	brightness = 0.3,
-- 	hue = 1,
-- 	saturation = 1.0,
-- }

-- config.unix_domains = {
-- 	{
-- 		name = "unix",
-- 	},
-- }
-- config.keys = config.keys or {}
-- table.insert(config.keys, {
-- 	key = "F12",
-- 	mods = "CTRL",
-- 	action = wezterm.action_callback(function(window, pane)
-- 		toggle_terminal.toggle(window, pane)
-- 	end),
-- })

-- config.default_gui_startup_args = { "connect", "unix" }

return config
