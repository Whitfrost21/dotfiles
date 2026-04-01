local gl = require("galaxyline")
local gls = gl.section
local condition = require("galaxyline.condition")
local vcs = require("galaxyline.providers.vcs")
local diagnostic = require("galaxyline.providers.diagnostic")

gl.short_line_list = { "NvimTree", "lazy", "Outline", "nvdash" }

-- 🐠 Aquarium theme colors
local c = {
  bg         = "#20202A",
  statusbg   = "#262630",
  lightbg    = "#2e2e38",
  fg         = "#ced4df",
  grey       = "#484852",
  red        = "#ebb9b9",
  green      = "#b1dba4",
  blue       = "#CDDBF9",
  nord_blue  = "#BCCAEB",
  yellow     = "#E6DFB8",
  purple     = "#f6bbe7",
  cyan       = "#b8dceb",
  orange     = "#E8CCA7",
  teal       = "#AEDCB7",
  one_bg     = "#2a2a34",
  one_bg2    = "#34343e",
}

local lc = ""   -- left bubble cap
local rc = ""   -- right bubble cap

-- ──────────────────────────────────────────────
-- LEFT
-- ──────────────────────────────────────────────

-- Mode bubble
gls.left[1] = {
  ModeCapL = {
    provider = function() return lc end,
    highlight = { c.nord_blue, c.statusbg },
  },
}

gls.left[2] = {
  ViMode = {
    provider = function()
      local modes = {
        n  = { "  NORMAL ",  c.nord_blue },
        i  = { "  INSERT ",  c.green },
        v  = { "  VISUAL ",  c.purple },
        V  = { "  V-LINE ",  c.purple },
        ["\22"] = { "  V-BLOCK", c.purple },
        c  = { "  COMMAND",  c.yellow },
        R  = { "  REPLACE",  c.red },
        t  = { "  TERM ",    c.cyan },
        s  = { "  SELECT ",  c.teal },
      }
      local mode = vim.fn.mode()
      local info = modes[mode] or { "  UNKNOWN", c.grey }
      -- dynamically recolor the bubble per mode
      vim.api.nvim_set_hl(0, "GalaxyViMode",   { fg = c.bg,    bg = info[2], bold = true })
      vim.api.nvim_set_hl(0, "GalaxyModeCapL", { fg = info[2], bg = c.statusbg })
      vim.api.nvim_set_hl(0, "GalaxyModeCapR", { fg = info[2], bg = c.statusbg })
      return info[1]
    end,
    highlight = { c.bg, c.nord_blue, "bold" },
  },
}

gls.left[3] = {
  ModeCapR = {
    provider = function() return rc .. "  " end,
    highlight = { c.nord_blue, c.statusbg },
  },
}

-- Git branch bubble
gls.left[4] = {
  GitCapL = {
    provider = function() return lc end,
    condition = condition.check_git_workspace,
    highlight = { c.one_bg2, c.statusbg },
  },
}

gls.left[5] = {
  GitBranch = {
    provider = function()
      local branch = vcs.get_git_branch()
      return branch and ("  " .. branch .. " ") or ""
    end,
    condition = condition.check_git_workspace,
    highlight = { c.yellow, c.one_bg2, "bold" },
  },
}

gls.left[6] = {
  GitCapR = {
    provider = function() return rc .. "  " end,
    condition = condition.check_git_workspace,
    highlight = { c.one_bg2, c.statusbg },
  },
}

-- File name bubble
gls.left[7] = {
  FileCapL = {
    provider = function() return lc end,
    highlight = { c.lightbg, c.statusbg },
  },
}

gls.left[8] = {
  FileName = {
    provider = function()
      local fname = vim.fn.expand("%:t")
      if fname == "" then return "  No File " end
      local icon = require("nvim-web-devicons").get_icon(fname) or ""
      local modified = vim.bo.modified and " ●" or ""
      return "  " .. icon .. " " .. fname .. modified .. " "
    end,
    highlight = { c.fg, c.lightbg },
  },
}

gls.left[9] = {
  FileCapR = {
    provider = function() return rc end,
    highlight = { c.lightbg, c.statusbg },
  },
}

-- ──────────────────────────────────────────────
-- RIGHT
-- ──────────────────────────────────────────────

-- LSP Diagnostics bubble
gls.right[1] = {
  DiagCapL = {
    provider = function() return lc end,
    condition = condition.check_active_lsp,
    highlight = { c.one_bg2, c.statusbg },
  },
}

gls.right[2] = {
  DiagError = {
    provider = diagnostic.get_diagnostic_error,
    icon = "  ",
    condition = condition.check_active_lsp,
    highlight = { c.red, c.one_bg2 },
  },
}

gls.right[3] = {
  DiagWarn = {
    provider = diagnostic.get_diagnostic_warn,
    icon = "  ",
    condition = condition.check_active_lsp,
    highlight = { c.yellow, c.one_bg2 },
  },
}

gls.right[4] = {
  DiagHint = {
    provider = diagnostic.get_diagnostic_hint,
    icon = "  ",
    condition = condition.check_active_lsp,
    highlight = { c.cyan, c.one_bg2 },
  },
}

gls.right[5] = {
  DiagCapR = {
    provider = function() return rc .. "  " end,
    condition = condition.check_active_lsp,
    highlight = { c.one_bg2, c.statusbg },
  },
}

-- File type bubble
gls.right[6] = {
  FtCapL = {
    provider = function() return lc end,
    highlight = { c.one_bg, c.statusbg },
  },
}

gls.right[7] = {
  FileType = {
    provider = function()
      local ft = vim.bo.filetype
      return ft ~= "" and ("  " .. ft .. " ") or "  plain "
    end,
    highlight = { c.cyan, c.one_bg, "bold" },
  },
}

gls.right[8] = {
  FtCapR = {
    provider = function() return rc .. "  " end,
    highlight = { c.one_bg, c.statusbg },
  },
}

-- Position bubble
gls.right[9] = {
  PosCapL = {
    provider = function() return lc end,
    highlight = { c.teal, c.statusbg },
  },
}

gls.right[10] = {
  LineCol = {
    provider = function()
      local line = vim.fn.line(".")
      local col  = vim.fn.col(".")
      local total = vim.fn.line("$")
      return string.format("  %d/%d : %d ", line, total, col)
    end,
    highlight = { c.bg, c.teal, "bold" },
  },
}

gls.right[11] = {
  PosCapR = {
    provider = function() return rc end,
    highlight = { c.teal, c.statusbg },
  },
}
