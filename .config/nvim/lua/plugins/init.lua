return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- un comment for format on save
        opts = require "configs.conform",
    },
    {
        "NTBBloodbath/galaxyline.nvim",
        pin = true,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
        config = function()
            require("custom.statusline")
        end,
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {

                    -- Go: Use goimports for Go code formatting
                    null_ls.builtins.formatting.goimports,



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
    {
        "stevearc/oil.nvim",
        lazy = false,
        opts = {
            default_file_explorer = true,
            view_options = {
                show_hidden = true,
            },
            -- Make it float!
            float = {
                padding = 2,
                max_width = 80,
                max_height = 30,
                border = "rounded",
                win_options = {
                    winblend = 10, -- slight transparency
                },
            },
        },
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },

    },

    {
        "akinsho/toggleterm.nvim",
        keys = { "<C-\\>" },
        opts = {
            size = 15,
            open_mapping = [[<C-\>]],
            direction = "float",
            float_opts = { border = "rounded" },
        },
    },
  {
  "folke/flash.nvim",
  event = "VeryLazy",
opts = {
  labels = "asdfghjklqwertyuiop",
  label = {
    uppercase = false,
    rainbow = { enabled = true, shade = 5 },
  },
  modes = {
    search = { enabled = false }
  },
  keys = {
    ["<esc>"] = "close",    -- only esc closes
    ["<bs>"] = "del",       -- backspace deletes a char
    ["<cr>"] = "jump",      -- enter to jump
    -- remove s and n from special keys so they type normally
  },
},
},

    { "L3MON4D3/LuaSnip", build = nil, pin = true },
}
