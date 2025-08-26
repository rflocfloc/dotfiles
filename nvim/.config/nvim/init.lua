-- ----------
-- [[ INIT ]]
-- ----------

-- -- Add plugins v0.12+
-- -- In case remove pack dir

-- vim.pack.add({
--   { src = "https://github.com/neovim/nvim-lspconfig.git"},                              -- LSP presets
--   { src = "https://github.com/mason-org/mason.nvim.git"},                               -- LSP installer
--   { src = "https://github.com/nvim-treesitter/nvim-treesitter.git" },                   -- treesitter presets
--   -- { src = "https://github.com/Saghen/blink.cmp.git", version = "1.*"},                                   -- Autocompletition
--   { src = "https://github.com/mfussenegger/nvim-ansible.git"},                          -- LSP/treesitter syntax for ansible
--   { src = "https://github.com/ibhagwan/fzf-lua.git", priority = 1000},                  -- fuzzy finder
--   { src = "https://github.com/echasnovski/mini.icons.git"},                             -- icons
--   { src = "https://github.com/vague2k/vague.nvim", priority = 1000},                    -- colorscheme
--   { src = "https://github.com/ThePrimeagen/vim-be-good.git"},                           -- practice vim motions
-- })

-- Setting leader key
vim.g.mapleader =  " "

-- Load plugin setups
require "plugins.fzf-lua"
require "plugins.nvim-treesitter"
require "plugins.mason"
require "plugins.vague"

-- Packages in pack/plugins/opt are loaded on command by typing
-- :packadd myplugin

-- Coloscheme
vim.cmd.colorscheme("vague")


