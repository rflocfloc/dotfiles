-- ---------------------
-- [[ Install Plugins ]]
-- ---------------------

-- For nvim 0.12
-- -- In case remove pack dir

-- vim.pack.add({
--   { src = "https://github.com/nvim-treesitter/nvim-treesitter.git" },
--   { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git" },
--   { src = "https://github.com/mfussenegger/nvim-ansible.git"},
--   { src = "https://github.com/ibhagwan/fzf-lua.git", priority = 1000},
--   { src = "https://github.com/vague2k/vague.nvim", priority = 1000},
-- })

require("config.lazy")

-- -----------------
-- [[ Colorscheme ]]
-- -----------------

-- Set background preference
vim.opt.background = 'dark'

-- Load colorscheme with fallback
local colorscheme = 'kanagawa-dragon'
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  vim.cmd('colorscheme habamax')
end
