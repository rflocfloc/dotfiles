-- ---------------------
-- [[ Install Plugins ]]
-- ---------------------

-- For nvim 0.12
vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter.git", version = 'main'},
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git", version = 'main' },
  { src = "https://github.com/ibhagwan/fzf-lua.git"},
  { src = "https://github.com/nvim-mini/mini.icons.git"},
  { src = "https://github.com/neovim/nvim-lspconfig"},
  -- Colorschemes
  { src = "https://github.com/rebelot/kanagawa.nvim.git"},
  { src = "https://github.com/thesimonho/kanagawa-paper.nvim"},
  { src = "https://github.com/rose-pine/neovim.git", name="rose-pine"},
  { src = "https://github.com/vague2k/vague.nvim"},
})

-- -----------------
-- [[ Colorscheme ]]
-- -----------------

-- Set background preference
vim.opt.background = 'dark'

-- Load colorscheme with fallback
local colorscheme = 'vague'
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  vim.cmd('colorscheme default')
end

-- --------------------------
-- [[ General Autocommands ]]
-- --------------------------

local function augroup(name)
  return vim.api.nvim_create_augroup('User_' .. name, { clear = true })
end

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = augroup('HighlightText'),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
    desc = 'Remove end of line whitespaces on writing',
    group = augroup('RemoveWhitespaces'),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- vim.api.nvim_create_autocmd('CmdlineLeave', {
--     pattern = '*',
--     group = augroup('ClearCmdline'),
--     desc = "clear command line 3 seconds after leaving command mode",
--     callback = function()
--         vim.defer_fn(function()
--             if vim.fn.mode() == 'n' then
--                 vim.cmd('echo ""')
--             end
--         end, 1000) -- 1000ms = 1 seconds
--     end,
-- })
