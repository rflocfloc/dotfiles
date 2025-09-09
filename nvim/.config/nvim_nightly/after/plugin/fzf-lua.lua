local actions = require'fzf-lua.actions'
require 'fzf-lua'.setup({
    'telescope',
    actions = {
        files = {
            -- instead of the default action 'actions.file_edit_or_qf'
            -- it's important to define all other actions here as this
            -- table does not get merged with the global defaults
            ["default"]       = actions.file_edit,
            ["ctrl-s"]        = actions.file_split,
            ["ctrl-v"]        = actions.file_vsplit,
            ["ctrl-t"]        = actions.file_tabedit,
            ["alt-q"]         = actions.file_sel_to_qf,
        },
    },
})

-- -- keymaps
local fzf = require('fzf-lua')
vim.keymap.set('n', '<leader>sf', fzf.files, { desc = 'Search files' })
vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>sb', fzf.buffers, { desc = 'Search buffers' })

