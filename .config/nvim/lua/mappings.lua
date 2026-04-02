require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Indenting
map("v", "<Tab>", ">gv", { desc = "Indent line" })
map("v", "<S-Tab>", "<gv", { desc = "Outdent line" })
map("i", "<Tab>", "<C-t>", { desc = "Indent" })
map("i", "<S-Tab>", "<C-d>", { desc = "Outdent" })

-- Oil.nvim (replaces -  key)
map("n", "-", function() require("oil").open_float() end, { desc = "Open oil (float)" })

-- Harpoon
local harpoon = require("harpoon")
map("n", "<leader>a", function() harpoon:list():add() end,           { desc = "Harpoon add file" })
map("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })
map("n", "<leader>1", function() harpoon:list():select(1) end,       { desc = "Harpoon file 1" })
map("n", "<leader>2", function() harpoon:list():select(2) end,       { desc = "Harpoon file 2" })
map("n", "<leader>3", function() harpoon:list():select(3) end,       { desc = "Harpoon file 3" })
map("n", "<leader>4", function() harpoon:list():select(4) end,       { desc = "Harpoon file 4" })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>",  { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",   { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>",     { desc = "Find buffers" })
map("n", "<leader>fs", "<cmd>Telescope grep_string<cr>", { desc = "Grep word under cursor" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>",    { desc = "Recent files" })



vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function()
    map("n", "q", "<cmd>bd<cr>", { buffer = true, desc = "Close oil" })
  end,
})
