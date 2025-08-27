-- -------------
-- [[ KEYMAPS ]]
-- -------------

local keymap = vim.keymap.set

keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', {desc = 'Clear search highlights on search pressing <Esc>'})
keymap('t', '<Esc>', '<C-\\><C-N>', {desc = 'Exit terminal mode with <Esc>'})

keymap('n', '<C-d>', '<C-d>zz', {desc = 'Scroll down, centered'})
keymap('n', '<C-u>', '<C-u>zz', {desc = 'Scroll up, centered'})
keymap('n', 'n', 'nzzzv', { desc = 'Next search result, centered' })
keymap('n', 'N', 'Nzzzv', { desc = 'Prev search result, centered' })

keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to upper window' })

keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

keymap('n', '<A-h>', '<<', { noremap = true, silent = true, desc = 'Move line to the left' })
keymap('n', '<A-l>', '>>', { noremap = true, silent = true, desc = 'Move line to the right' })
keymap('n', '<A-j>', ':m +1<CR>==', { noremap = true, silent = true, desc = 'Move line down' })
keymap('n', '<A-k>', ':m -2<CR>==', { noremap = true, silent = true, desc = 'Move line up' })
keymap({'v', 'x'}, '<A-h>', '<gv', { noremap = true, silent = true, desc = 'Move selection to the left' })
keymap({'v', 'x'}, '<A-l>', '>gv', { noremap = true, silent = true, desc = 'Move selection to the right' })
keymap({'v', 'x'}, '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true, desc = 'Move selection down' })
keymap({'v', 'x'}, '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true, desc = 'Move selection up' })

keymap({'v', 'n'}, '<leader>d', "\"_d", { noremap = true, silent = true, desc = 'Delete to blackhole' })
keymap({'v', 'n'}, '<leader>p', [["_dP]], { noremap = true, silent = true, desc = 'Delete to blackhole and Paste' })

keymap('x', '<leader>y', [["+y]], { noremap = true, silent = true, desc = 'Yank to system clipboard' })

keymap('v', '<leader>r', "\"hy:%s/<C-r>h//g<left><left>", { noremap = true, silent = true, desc = 'Replace selection globally' })

keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", {desc = 'Make this file executable'})

keymap('n', '<leader>e', ':Ex<CR>', { noremap = true, silent = true, desc = 'Open Explorer'})

keymap('n', '<leader>sf',  ':FzfLua files<CR>' , {desc = 'Search Files' })
keymap('n', '<leader>sb', ':FzfLua buffers<CR>', {desc = 'Search Buffers' })
keymap('n', '<leader>sg', ':FzfLua live_grep<CR>', {desc = 'Search Grep' })
keymap('n', '<leader>sw', ':FzfLua grep_cword<CR>', {desc = 'Search current Word' })
