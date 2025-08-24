-- -------------
-- [[ KEYMAPS ]]
-- -------------

-- Setting leader key
vim.g.mapleader =  " "
vim.g.maplocalleader = " "

-- Clear highlights on search pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode pressing <Esc>
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>')

--  Center curson when scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz', {desc = 'Scroll down and center cursor'})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {desc = 'Scroll up and center cursor'})

--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Move between buffers keymaps
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

--  Use Alt+<hjkl> to move lines 
-- (Normal mode)
vim.keymap.set('n', '<A-h>', '<<', { noremap = true, silent = true, desc = 'Move line to the left' })
vim.keymap.set('n', '<A-l>', '>>', { noremap = true, silent = true, desc = 'Move line to the right' })
vim.keymap.set('n', '<A-j>', ':m +1<CR>==', { noremap = true, silent = true, desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m -2<CR>==', { noremap = true, silent = true, desc = 'Move line up' })
-- (Visual and Block mode)
vim.keymap.set({'v', 'x'}, '<A-h>', '<gv', { noremap = true, silent = true, desc = 'Move block selection to the left' })
vim.keymap.set({'v', 'x'}, '<A-l>', '>gv', { noremap = true, silent = true, desc = 'Move block selection to the right' })
vim.keymap.set({'v', 'x'}, '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true, desc = 'Move block selection down' })
vim.keymap.set({'v', 'x'}, '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true, desc = 'Move block selection up' })

-- Delete to blackhole registry (without yank)
vim.keymap.set({'v', 'n'}, '<leader>d', "\"_d", { noremap = true, silent = true, desc = 'Delete to blackhole' })
vim.keymap.set({'v', 'n'}, '<leader>p', [["_dP]], { noremap = true, silent = true, desc = 'Delete to blackhole and Paste' })

-- Yank to system clipboard
vim.keymap.set('x', '<leader>y', [["+y]], { noremap = true, silent = true, desc = 'Yank to system clipboard' })

-- Replace selection in file
vim.keymap.set('v', '<leader>r', "\"hy:%s/<C-r>h//g<left><left>", { noremap = true, silent = true, desc = 'Replace selection globally' })

-- [[ Netrw ]]
vim.keymap.set('n', '<leader>e', ':Ex<CR>', { noremap = true, silent = true, desc = 'Open [E]xplorer'})

-- [[ Fzf-lua ]]
vim.cmd("packadd fzf-lua")    -- Force reload plugin
vim.keymap.set('n', '<leader>sf',  ':FzfLua files<CR>' , {desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sb', ':FzfLua buffers<CR>', {desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<leader>sg', ':FzfLua live_grep<CR>', {desc = '[S]earch [G]rep' })
vim.keymap.set('n', '<leader>sw', ':FzfLua grep_cword<CR>', {desc = '[S]earch current [W]ord' })
