vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.env.TERM = "wezterm"

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
  { "williamboman/mason.nvim", cmd = "Mason" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },  -- Add Treesitter for syntax highlighting
}, lazy_config)

-- Set up mason to install LSP servers automatically
require("mason").setup()

-- LSP setup for Go, Python, and PHP
local lspconfig = require("lspconfig")
lspconfig.gopls.setup({})
lspconfig.pyright.setup({})
lspconfig.intelephense.setup({})

-- LuaSnip setup
local luasnip = require("luasnip")
vim.api.nvim_set_keymap("i", "<Tab>", "luasnip.expand_or_jump()", { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<Tab>", "luasnip.expand_or_jump()", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "luasnip.jump(-1)", { noremap = true, silent = true })
require("luasnip.loaders.from_vscode").load()

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
})

-- Treesitter setup for Go, Python, and PHP
require("nvim-treesitter.configs").setup({
  ensure_installed = { "go", "python", "php" },
  highlight = {
    enable = true,  -- Enable Treesitter highlighting
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,  -- Enable Treesitter-based indentation
  },
})

-- Load theme and other NvChad settings
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
