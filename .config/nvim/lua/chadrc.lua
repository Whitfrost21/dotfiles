---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyodark",
}

-- Adding nvdash to load on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then  -- Checks if no files were passed to Neovim
      vim.cmd "Nvdash"
    end
  end,
})

-- Auto format on save for different file types (Only if LSP is available)
vim.cmd([[
  autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.html,*.json,*.css,*.scss,*.md lua vim.lsp.buf.format()
  autocmd BufWritePre *.go lua vim.lsp.buf.format()  -- Go-specific
  autocmd BufWritePre *.py lua vim.lsp.buf.format()
]])



return M
