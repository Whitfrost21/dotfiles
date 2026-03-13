local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

-- FAST RENDERING
config.front_end = "WebGpu"
config.enable_wayland = true
config.max_fps = 144

-- TRANSPARENCY
config.window_background_opacity = 0
config.text_background_opacity = 1.0


-- WINDOW
config.window_decorations = "NONE"
config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 14,
  right = 14,
  top = 10,
  bottom = 10,
}

-- FONT
-- config.font = wezterm.font("JetBrains Mono Nerd Font")
-- config.font_size = 11.5
-- config.colors = {
--   background = "rgba(18, 18, 22, 0.88)",
--   foreground = "#D3C6AA",
-- }



-- LOOK
config.enable_tab_bar = false
config.cursor_blink_rate = 1000
config.default_cursor_style = "BlinkingBar"

-- No lag stuff
config.audible_bell = "Disabled"
config.scrollback_lines = 5000

-- Scroll tuning (slower, but still smooth)
-- config.mouse_wheel_scrolls_lines = 1

-- text clarity 
config.line_height = 1.12
config.freetype_load_flags = "NO_HINTING"
config.bold_brightens_ansi_colors = true

-- keybindings
config.keys = {
  -- Tabs 
  { key = "t", mods = "CTRL", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
{ key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
  -- Splits (panes)
  -- Ctrl+H → horizontal split (top/bottom)
  { key = "h", mods = "CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

  -- Ctrl+V → vertical split (left/right)
  { key = "v", mods = "CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

  -- Close pane
  { key = "w", mods = "CTRL", action = act.CloseCurrentPane({ confirm = false }) },
}
return config

