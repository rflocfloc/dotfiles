-- [[ User Settings ]]
vim.g.mapleader = " "		-- Important to set mapleader before requiring lazy.nvim for compatibility
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true	-- Set to true if you have a Nerd Font installed and selected in the terminal

-- [[ Loading Utils ]]
require "utils.floating_terminal"

-- [[ Loading Plugins ]]
require "plugins.mason"
require "plugins.nvim-ansible" -- LSP config for ansible
require "plugins.treesitter"
require "plugins.fzf-lua"
require "plugins.lualine"
require "plugins.which-key"
require "plugins.render-markdown"

-- [[ Colorscheme ]]
require "plugins.colorscheme"

-- [[ Games ]]
vim.pack.add({"https://github.com/ThePrimeagen/vim-be-good.git"})
