-- [[ Add Plugins ]]
vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig.git"},      -- LSP presets
  { src = "https://github.com/mason-org/mason.nvim.git"},       -- LSP installer
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

