vim.opt.number = true -- 行号
vim.opt.cursorline = true -- 高亮光标所在行
vim.opt.autoread = true -- 当文件被外部程序修改时，自动重载

-- split window 从下边和右边出现
vim.opt.splitbelow = false
vim.opt.splitright = true

vim.opt.clipboard = "unnamedplus" -- 同步系统剪贴板
vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.winborder = 'rounded'

vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 3

-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
