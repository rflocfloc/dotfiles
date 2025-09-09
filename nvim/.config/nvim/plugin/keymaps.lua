vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', {desc = "<Esc> to clear search highlights"})
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', {desc = "<Esc> to exit terminal mode"})

vim.keymap.set({'v', 'x'}, '<S-h>', '<gv', { noremap = true, silent = true, desc = 'Move selection to the left' })
vim.keymap.set({'v', 'x'}, '<S-l>', '>gv', { noremap = true, silent = true, desc = 'Move selection to the right' })
vim.keymap.set({'v', 'x'}, '<S-j>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true, desc = 'Move block selection down' })
vim.keymap.set({'v', 'x'}, '<S-k>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true, desc = 'Move block selection up' })

vim.keymap.set({'v', 'n'}, '<leader>d', "\"_d", { noremap = true, silent = true, desc = 'Delete to blackhole' })
vim.keymap.set({'v', 'n'}, '<leader>p', [["_dP]], { noremap = true, silent = true, desc = 'Delete to blackhole and Paste' })

vim.keymap.set('x', '<leader>y', [["+y]], { noremap = true, silent = true, desc = 'Yank to system clipboard' })

vim.keymap.set('v', '<leader>r', "\"hy:%s/<C-r>h//g<left><left>", { noremap = true, silent = true, desc = 'Replace selection globally' })

vim.keymap.set('n', '<C-d>', '<C-d>zz', {noremap = true, silent = true, desc = 'Scroll down, centered'})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {noremap = true, silent = true, desc = 'Scroll up, centered'})
vim.keymap.set('n', 'n', 'nzzzv', {noremap = true, silent = true,  desc = 'Next search result, centered' })
vim.keymap.set('n', 'N', 'Nzzzv', {noremap = true, silent = true,  desc = 'Prev search result, centered' })
