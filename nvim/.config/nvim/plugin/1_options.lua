-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.inccommand = 'split'
vim.opt.confirm = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Search settings
vim.opt.smartcase = true

-- Visual settings
vim.opt.termguicolors = true
vim.opt.guicursor = ""
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- File handling/history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

