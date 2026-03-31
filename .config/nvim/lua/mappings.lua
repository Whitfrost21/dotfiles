require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("i", "<Tab>", "<cmd>v:count == 0 ? '<Tab>' : '<C-t>'<cr>", { expr = true, desc = "Indent" })
map("i", "<S-Tab>", "<C-d>", { desc = "Outdent" })

-- Indenting in Visual Mode (keeps the selection active)
map("i", "<Tab>", "<C-t>", { desc = "Indent" })
map("i", "<S-Tab>", "<C-d>", { desc = "Outdent" })

-- Visual Mode (Keep these, they work great)
map("v", "<Tab>", ">gv", { desc = "Indent line" })
map("v", "<S-Tab>", "<gv", { desc = "Outdent line" })
