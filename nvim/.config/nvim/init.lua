-- [[ User Settings ]]
vim.g.mapleader = " "		-- Important to set mapleader before requiring lazy.nvim for compatibility
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true	-- Set to true if you have a Nerd Font installed and selected in the terminal

-- [[ Loading config ]]
require "config.options"
require "config.keymaps"
require "config.autocmds"

-- [[ Loading Utils ]]
require "utils.floating_terminal"

-- [[ Loading Plugins ]]
require "plugins.lsp"
require "plugins.treesitter"
require "plugins.fzf-lua"
require "plugins.arrow"
require "plugins.lualine"
require "plugins.which-key"
require "plugins.nvim-ansible" -- LSP config for ansible

-- [[ Colorscheme ]]
require "plugins.colorscheme"
