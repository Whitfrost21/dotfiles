-- Aqua Flow (Zed to NvChad conversion)
-- Author: https://github.com/Whitfrost21/aquaflow-zed

local M = {}

M.base_30 = {
  white = "#c8d3df",
  darker_black = "#060b10",
  black = "#0a0f14", -- background
  black2 = "#10161d",
  one_bg = "#141b22",
  one_bg2 = "#162028",
  one_bg3 = "#1a2730",
  grey = "#2e3942",
  grey_fg = "#3a4450",
  grey_fg2 = "#4b5258",
  light_grey = "#5a6167",
  red = "#ff6b81",
  baby_pink = "#ff7a93",
  pink = "#de73ff",
  line = "#141b22",
  green = "#66ffc6",
  vibrant_green = "#68F9C4",
  blue = "#61afef",
  nord_blue = "#73cfff",
  yellow = "#f0b232",
  sun = "#ffdd80",
  purple = "#c678dd",
  dark_purple = "#bd93f9",
  teal = "#72efdd",
  orange = "#f0b232",
  cyan = "#4fd1d9",
  statusline_bg = "#0a0f14",
  lightbg = "#10161d",
  pmenu_bg = "#61afef",
  folder_bg = "#61afef",
}

M.base_16 = {
  base00 = "#0a0f14", -- Background
  base01 = "#10161d", -- Elements
  base02 = "#141b22", -- Active line
  base03 = "#2e3942", -- Guide lines
  base04 = "#3a4450", -- Line number
  base05 = "#c8d3df", -- Foreground
  base06 = "#d7dae0",
  base07 = "#ffffff",
  base08 = "#ff6b81", -- Error
  base09 = "#f0b232", -- Warning
  base0A = "#ffff34", -- Constant
  base0B = "#66ffc6", -- String
  base0C = "#72efdd", -- Attribute
  base0D = "#61afef", -- Function
  base0E = "#c678dd", -- Keyword
  base0F = "#4fd1d9", -- Cursor / Cyan
}

M.polish_hl = {
  ["@comment"] = { fg = "#7f8caa", italic = true },
  ["@keyword"] = { fg = "#66d2ce" },
  ["@operator"] = { fg = "#eaeaea" },
  ["@punctuation"] = { fg = "#8b95a1" },
  ["@variable"] = { fg = "#00ffde" },
  ["@constant"] = { fg = "#ffff34" },
  ["@number"] = { fg = "#fdffe2" },
  ["@boolean"] = { fg = "#ffffff" },
  ["@string"] = { fg = "#68F9C4" },
  ["@string.escape"] = { fg = "#a3ff9c" },
  ["@attribute"] = { fg = "#72efdd" },
  ["@property"] = { fg = "#8fd6f8" },
  ["@function"] = { fg = "#98D8EF" },
  ["@constructor"] = { fg = "#61afef" },
  ["@class"] = { fg = "#73e8e3", bold = true },
  ["@type"] = { fg = "#E3D2C3" },
  ["@enum"] = { fg = "#56b6c2" },
  ["@tag"] = { fg = "#7de8ef" },
  ["@title"] = { fg = "#5ad1c4" },
  ["@text.uri"] = { fg = "#56cfe1" },
  ["@text.reference"] = { fg = "#61afef" },
  ["DiagnosticError"] = { fg = "#ff6b81" },
  ["DiagnosticWarn"] = { fg = "#f0b232" },
  ["DiagnosticHint"] = { fg = "#8b949e" },
}

M.type = "dark"

return M
