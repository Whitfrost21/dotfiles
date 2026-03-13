return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- un comment for format on save
        opts = require "configs.conform",
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {

                    -- Go: Use goimports for Go code formatting
                    null_ls.builtins.formatting.goimports,



                    -- You can add other language formatters here if needed
                },
            })
        end
    },
    -- Other plugins...
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    -- 			"html", "css"
    -- 		},
    -- 	},
    -- },
}
