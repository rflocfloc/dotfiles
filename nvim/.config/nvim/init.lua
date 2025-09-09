-- -----------------
-- [[ Colorscheme ]]
-- -----------------

-- Set background preference
vim.opt.background = 'dark'

-- Load colorscheme with fallback
local colorscheme = 'kanagawa-dragon'
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  vim.cmd('colorscheme slate')
end
