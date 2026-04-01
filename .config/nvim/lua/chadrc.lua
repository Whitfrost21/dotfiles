---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "aquarium",
}
M.ui = {
  statusline = {
    theme = "none",  -- disables NvChad's default statusline
  },
}
-- Proper indentation settings
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.smartindent = true

-- Open dashboard on startup
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 then
            vim.cmd "Nvdash"
        end
    end,
})

-- Auto format on save (only if LSP attached)
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.html", "*.json", "*.css", "*.scss", "*.md", "*.go", "*.py" },
    callback = function()
        if vim.lsp.buf.format then
            vim.lsp.buf.format()
        end
    end,
})

return M
