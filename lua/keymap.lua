-- nvim-tree
local api = require("nvim-tree.api")
vim.keymap.set("n", "<leader>e", function()
	api.tree.focus()
end)

vim.keymap.set("n", "<C-n>", function()
	api.tree.toggle()
end)

-- hop
local hop = require("hop")
local directions = require("hop.hint").HintDirection
-- vim.keymap.set("n", "gf", function()
-- 	hop.hint_char2({ direction = directions.AFTER_CURSOR })
-- end, { remap = true })
-- vim.keymap.set("n", "gF", function()
-- 	hop.hint_char2({ direction = directions.BEFORE_CURSOR })
-- end, { remap = true })
vim.keymap.set("n", "gb", ":BufferLinePick<CR>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
-- 插入模式的移动
vim.keymap.set("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "move end of line" })
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "move left" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "move right" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "move down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "move up" })

-- 聚焦窗口的移动
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "switch window left" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "switch window right" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "switch window down" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "switch window up" })
vim.keymap.set("t", "<A-h>", "<C-\\><C-N><C-w>h", { desc = "switch window left in terminal" })
vim.keymap.set("t", "<A-l>", "<C-\\><C-N><C-w>l", { desc = "switch window right in terminal" })
vim.keymap.set("t", "<A-j>", "<C-\\><C-N><C-w>j", { desc = "switch window down in terminal" })
vim.keymap.set("t", "<A-k>", "<C-\\><C-N><C-w>k", { desc = "switch window up in terminal" })

-- LSP 相关
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "<leader>s", vim.lsp.buf.signature_help)

-- telescope
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
vim.keymap.set("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
vim.keymap.set(
	"n",
	"<leader>fz",
	"<cmd>Telescope current_buffer_fuzzy_find<CR>",
	{ desc = "telescope find in current buffer" }
)
vim.keymap.set("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
vim.keymap.set("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
local builtin = require("telescope.builtin")
vim.keymap.set("n", "fr", function()
	builtin.lsp_references({ initial_mode = "normal" })
end, { noremap = true, silent = true })

-- temrinal
local term = require("toggleterm")
vim.keymap.set("n", "<C-`>", function()
	term.toggle(1, nil, "float", nil, "terminal")
end, { desc = "toggle flaot terminal" })
vim.keymap.set("t", "<C-`>", function()
	term.toggle(1, nil, "float", nil, "terminal")
end, { desc = "toggle flaot terminal" })
