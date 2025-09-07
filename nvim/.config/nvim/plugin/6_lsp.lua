-- ----------------
-- [[ LSP CONFIG ]]
-- ----------------

-- Enable LSP
vim.lsp.enable "lua_ls"
vim.lsp.enable "bashls"
vim.lsp.enable "pyright"
vim.lsp.enable "ansiblels"
vim.lsp.enable "marksman"

vim.diagnostic.config({virtual_text = false})      -- if true enables diagnostic text

-- [[ keymaps ]]
vim.keymap.set('n', 'grf', function() vim.lsp.buf.format { async = true } end, { desc = 'LSP: format buffer' })

