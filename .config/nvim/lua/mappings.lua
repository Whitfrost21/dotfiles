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

map("n", "n", "2<C-e>", {
  noremap = true,
  silent = true,
  desc = "Scroll window down",
})

map("n", "m", "2<C-y>", {
  noremap = true,
  silent = true,
  desc = "Scroll window up",
})
-- move visuals and lines
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
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
map("n", "<leader>fp", "<cmd>Telescope projects<CR>")

map("n","sw","viw",{desc="select word under cursor"})
map("n","dw","_dw",{desc="delete entire word without cut"})
map("n", "x", '"_x', { desc = "Delete char without cut" })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function()
    map("n", "q", "<cmd>bd<cr>", { buffer = true, desc = "Close oil" })
  end,
})

-- Jump to the NEXT placeholder in Insert and Select modes
map({ "i", "s" }, "<C-k>", function()
  if require("luasnip").expand_or_jumpable() then
    require("luasnip").expand_or_jump()
  end
end, { desc = "Luasnip jump next" })

-- Jump to the PREVIOUS placeholder in Insert and Select modes
map({ "i", "s" }, "<C-j>", function()
  if require("luasnip").jumpable(-1) then
    require("luasnip").jump(-1)
  end
end, { desc = "Luasnip jump prev" })

-- Splits
map("n", "<leader>wv", "<C-w>v", { desc = "Vertical Split" })
map("n", "<leader>ws", "<C-w>s", { desc = "Horizontal Split" })
-- Close
map("n", "<leader>wx", "<C-w>c", { desc = "Close Window" })
-- Equalize
map("n", "<leader>we", "<C-w>=", { desc = "Equalize Windows" })
--window resizing 
map("n", "<A-Left>",  ":vertical resize -3<CR>", { silent = true })
map("n", "<A-Right>", ":vertical resize +3<CR>", { silent = true })
map("n", "<A-Up>",    ":resize +2<CR>", { silent = true })
map("n", "<A-Down>",  ":resize -2<CR>", { silent = true })
-- Maximize current window
map("n", "<leader>wo", "<C-w>o", { desc = "Only Window" })
-- window sizers
map("n", "<A-Left>",  ":vertical resize -3<CR>", { silent = true })
map("n", "<A-Right>", ":vertical resize +3<CR>", { silent = true })
map("n", "<A-Up>",    ":resize +2<CR>", { silent = true })
map("n", "<A-Down>",  ":resize -2<CR>", { silent = true })
-- window movers
map("n", "<leader>wh", "<C-w>H", { desc = "Move Window Left" })
map("n", "<leader>wj", "<C-w>J", { desc = "Move Window Down" })
map("n", "<leader>wk", "<C-w>K", { desc = "Move Window Up" })
map("n", "<leader>wL", "<C-w>L", { desc = "Move Window Right" })

vim.keymap.set("n", "gl", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>cd", function()
  require("nvim-tree.api").tree.change_root_to_node()
end)

