-- Load NvChad LSP defaults
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require("nvchad.configs.lspconfig")

-- New Neovim 0.11 style per-server config
local servers = {
  html        = {},
  cssls       = {},
  gopls       = {
    settings = {
      gopls = {
        analyses  = { unusedparams = true },
        staticcheck = true,
      },
    },
  },
  pyright     = {},
  intelephense = {},
}

for server, opts in pairs(servers) do
  opts.on_attach    = nvlsp.on_attach
  opts.on_init      = nvlsp.on_init
  opts.capabilities = nvlsp.capabilities
  vim.lsp.config(server, opts)
  vim.lsp.enable(server)
end

-- Auto format Go files on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
