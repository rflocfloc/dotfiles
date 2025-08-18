-- [[ Add Plugin ]]
vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig.git"},
  { src = "https://github.com/mason-org/mason.nvim.git"},
})

-- [[ Plugin Setup ]]
require("mason").setup({
  ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

--- [[ Autocomand ]]
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup("UserConfig_LSP_enable", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method('textDocument/completion') then
      -- Enable auto-completion
      vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
    end
  end,
})

-- [[ keymaps ]]
vim.keymap.set('n', 'grf', function() vim.lsp.buf.format { async = true } end, { desc = 'LSP: format buffer' })

-- [[ Enable LSP ]]
vim.lsp.enable "lua_ls"
vim.lsp.enable "bashls"
vim.lsp.enable "pyright"
vim.lsp.enable "ansiblels"
vim.lsp.enable "marksman"
