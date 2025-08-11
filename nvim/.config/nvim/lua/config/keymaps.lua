-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Move between buffers keymaps
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

--  Use Alt+<hjkl> to move lines (Normal mode)
--  Up and Down is going to follow automatic indentation
vim.keymap.set('n', '<A-h>', '<<', { noremap = true, silent = true, desc = 'Move line to the left' })
vim.keymap.set('n', '<A-l>', '>>', { noremap = true, silent = true, desc = 'Move line to the right' })
vim.keymap.set('n', '<A-j>', ':m +1<CR>==', { noremap = true, silent = true, desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m -2<CR>==', { noremap = true, silent = true, desc = 'Move line up' })

--  Use Alt+<hjkl> to move lines (Visual and Block mode)
--  Up and Down is going to follow automatic indentation
vim.keymap.set({'v', 'x'}, '<A-h>', '<gv', { noremap = true, silent = true, desc = 'Move block selection to the left' })
vim.keymap.set({'v', 'x'}, '<A-l>', '>gv', { noremap = true, silent = true, desc = 'Move block selection to the right' })
vim.keymap.set({'v', 'x'}, '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true, desc = 'Move block selection down' })
vim.keymap.set({'v', 'x'}, '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true, desc = 'Move block selection up' })

-- Delete to blackhole registry (not saved)
vim.keymap.set({'v', 'n'}, '<leader>d', "\"_d", { noremap = true, silent = true, desc = 'Delete to blackhole' })
vim.keymap.set({'v', 'n'}, '<leader>p', [["_dP]], { noremap = true, silent = true, desc = 'Delete to blackhole and Paste' })

-- Replace selection in file
vim.keymap.set('v', '<leader>r', "\"hy:%s/<C-r>h//g<left><left>", { noremap = true, silent = true, desc = 'Replace selction globally' })
