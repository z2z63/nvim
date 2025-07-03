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
vim.keymap.set("n", "f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR })
end, { remap = true })
vim.keymap.set("n", "F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR })
end, { remap = true })
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
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "switch window left in terminal" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "switch window right in terminal" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "switch window down in terminal" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "switch window up in terminal" })

-- LSP 相关
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "<leader>s", vim.lsp.buf.signature_help)

-- temrinal
local term = require("toggleterm")
vim.keymap.set("n", "<C-`>", function()
	term.toggle(1, nil, "float", nil, "terminal")
end, { desc = "toggle flaot terminal" })
vim.keymap.set("t", "<C-`>", function()
	term.toggle(1, nil, "float", nil, "terminal")
end, { desc = "toggle flaot terminal" })


-- buffer 移动
vim.keymap.set("n" ,"<S-h>", "<cmd>bprevious<cr>")
vim.keymap.set("n" ,"<S-l>", "<cmd>bnext<cr>")


-- fzf-lua
local fzf=  require('fzf-lua')
vim.keymap.set("n","<leader>,","<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",{desc = "switch buffer"})

vim.keymap.set("n","<leader>,","<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",{desc = "switch buffer"})
vim.keymap.set("n","<leader>:","<cmd>FzfLua command_history<cr>",{desc = "command history"})
vim.keymap.set("n","<leader>fd","<cmd>FzfLua diagnostics_document<cr>",{desc = "docuemnt diagnostics"})
vim.keymap.set("n","<leader>fD","<cmd>FzfLua diagnostics_workspace<cr>",{desc = "workspace diagnostics"})
vim.keymap.set("n","<leader>sg","<cmd>FzfLua live_grep<cr>",{desc = "live grep"})
vim.keymap.set("n","<leader>fj","<cmd>FzfLua jumps<cr>",{desc = "jump list"})
vim.keymap.set("n","<leader>fm","<cmd>FzfLua marks<cr>",{desc = "find marks"})
vim.keymap.set("n","<leader>fb","<cmd>FzfLua buffers<cr>",{desc = "find buffers"})
vim.keymap.set("n","<leader>fs","<cmd>FzfLua lsp_document_symbols<cr>",{desc = "find symbols in current buffer"})
vim.keymap.set("n","<leader>fS","<cmd>FzfLua lsp_workspace_symbols<cr>",{desc = "find symbols in workspace"})
    --   { "<c-j>", "<c-j>", ft = "fzf", mode = "t", nowait = true }Find Files (cwd)" },
    --   { "<leader>fg", "<cmd>FzfLua git_files<cr>", desc = "Find Files (git-files)" },
    --   { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },
    --   { "<leader>fR", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
    --   -- git
    --   { "<leader>gc", "<cmd>FzfLua git_commits<CR>", desc = "Commits" },
    --   { "<leader>gs", "<cmd>FzfLua git_status<CR>", desc = "Status" },
    --   -- search
    --   { '<leader>s"', "<cmd>FzfLua registers<cr>", desc = "Registers" },
    --   { "<leader>sa", "<cmd>FzfLua autocmds<cr>", desc = "Auto Commands" },
    --   { "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>", desc = "Buffer" },
    --   { "<leader>sc", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
    --   { "<leader>sC", "<cmd>FzfLua commands<cr>", desc = "Commands" },
    --   { "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document Diagnostics" },
    --   { "<leader>sD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace Diagnostics" },
    --   { "<leader>sg", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
    --   { "<leader>sG", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
    --   { "<leader>sh", "<cmd>FzfLua help_tags<cr>", desc = "Help Pages" },
    --   { "<leader>sH", "<cmd>FzfLua highlights<cr>", desc = "Search Highlight Groups" },
    --   { "<leader>sj", "<cmd>FzfLua jumps<cr>", desc = "Jumplist" },
    --   { "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Key Maps" },
    --   { "<leader>sl", "<cmd>FzfLua loclist<cr>", desc = "Location List" },
    --   { "<leader>sM", "<cmd>FzfLua man_pages<cr>", desc = "Man Pages" },
    --   { "<leader>sm", "<cmd>FzfLua marks<cr>", desc = "Jump to Mark" },
    --   { "<leader>sR", "<cmd>FzfLua resume<cr>", desc = "Resume" },
    --   { "<leader>sq", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix List" },
    --   { "<leader>sw", LazyVim.pick("grep_cword"), desc = "Word (Root Dir)" },
    --   { "<leader>sW", LazyVim.pick("grep_cword", { root = false }), desc = "Word (cwd)" },
    --   { "<leader>sw", LazyVim.pick("grep_visual"), mode = "v", desc = "Selection (Root Dir)" },
    --   { "<leader>sW", LazyVim.pick("grep_visual", { root = false }), mode = "v", desc = "Selection (cwd)" },
    --   { "<leader>uC", LazyVim.pick("colorschemes"), desc = "Colorscheme with Preview" },
    --   {
    --     "<leader>ss",
    --     function()
    --       require("fzf-lua").lsp_document_symbols({
    --         regex_filter = symbols_filter,
    --       })
    --     end,
    --     desc = "Goto Symbol",
    --   },
    --   {
    --     "<leader>sS",
    --     function()
    --       require("fzf-lua").lsp_live_workspace_symbols({
    --         regex_filter = symbols_filter,
    --       })
    --     end,
    --     desc = "Goto Symbol (Workspace)",
    --   },
    -- },
