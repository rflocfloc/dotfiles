-- ---------------------
-- [[ Install Plugins ]]
-- ---------------------

-- For nvim 0.12

vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter.git", branch = 'main'},
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git", branch = 'main' },
  { src = "https://github.com/ibhagwan/fzf-lua.git"},
  { src = "https://github.com/rebelot/kanagawa.nvim.git"},
  { src = "https://github.com/rose-pine/neovim.git", name="rose-pine"},
  { src = "https://github.com/shaunsingh/nord.nvim.git"},
})

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
