-- Load defaults from NvChad's LSP setup
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- List of servers you want to configure (you can add more here)
local servers = { "html", "cssls", "gopls" }

-- Configure LSP servers with defaults
for _, lsp in ipairs(servers) do
  -- Setup each server (including gopls)
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    -- Additional configurations specific to gopls
    settings = lsp == "gopls" and {
      -- Add any specific settings for gopls here if necessary
    } or nil
  }
end

-- Auto format Go files on save
vim.cmd([[
  autocmd BufWritePre *.go lua vim.lsp.buf.format()
]])
