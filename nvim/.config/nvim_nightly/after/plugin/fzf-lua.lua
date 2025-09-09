require"fzf-lua".setup({
    "telescope",
})

-- keymaps
vim.keymap.set( 'n', "<leader>sf", ":FzfLua files<cr>", {desc = "Find files" }),
vim.keymap.set( 'n', "<leader>sg", ":FzfLua live_grep<cr>", {desc = "Live grep" }),
vim.keymap.set( 'n', "<leader>sb", ":FzfLua buffers<cr>", {desc = "Find buffers" }),
vim.keymap.set( 'n', "<leader>sa", ":FzfLua args<cr>", {desc = "Find args" }),
vim.keymap.set( 'n', "<leader>sh", ":FzfLua help_tags<cr>", {desc = "Help tags" }),
vim.keymap.set( 'n', "<leader>sr", ":FzfLua oldfiles<cr>", {desc = "Recent files" }),

