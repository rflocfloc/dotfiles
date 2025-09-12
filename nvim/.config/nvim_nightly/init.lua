-- ---------------------
-- [[ Install Plugins ]]
-- ---------------------

-- For nvim 0.12

vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter.git", version = 'main'},
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git", version = 'main' },
  { src = "https://github.com/ibhagwan/fzf-lua.git"},
  -- Colorschemes
  { src = "https://github.com/rebelot/kanagawa.nvim.git"},
  { src = "https://github.com/rose-pine/neovim.git", name="rose-pine"},
})

-- -----------------
-- [[ Colorscheme ]]
-- -----------------

-- Set background preference
vim.opt.background = 'dark'

-- Load colorscheme with fallback
local colorscheme = 'TODO'
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  vim.cmd('colorscheme default')
end

-- --------------------------
-- [[ General Autocommands ]]
-- --------------------------

local function augroup(name)
  return vim.api.nvim_create_augroup("User_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = augroup('HighlightText'),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = 'Remove end of line whitespaces on writing',
    group = augroup('RemoveWhitespaces'),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
