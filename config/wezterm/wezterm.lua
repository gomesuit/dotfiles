-- https://wezfurlong.org/wezterm/config/files.html

-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Tokyo Night Storm'
config.window_background_opacity = 0.95

-- font
config.font = wezterm.font 'Hack Nerd Font'
config.font_size = 13.0

-- keybinds
-- デフォルトのkeybindを無効化
config.disable_default_key_bindings = true
-- `keybinds.lua`を読み込み
local keybind = require 'keybinds'
-- keybindの設定
config.keys = keybind.keys
config.key_tables = keybind.key_tables
-- Leaderキーの設定
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }

-- and finally, return the configuration to wezterm
return config
