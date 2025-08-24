-- ------------------
-- [[ AUTOCOMMANDS ]]
-- ------------------

-- set local function
local function augroup(name)
  return vim.api.nvim_create_augroup("UserConfig_" .. name, { clear = true })
end

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('HighlightText'),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  desc = 'Resize splits if window is resized',
  group = augroup("ResizeSplits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Checks and reloads file when modified by another program/session
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  desc = 'Check if reload is needed when changing file',
  group = augroup("CheckFile"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- Closes unused terminals
vim.api.nvim_create_autocmd("TermClose", {
  group = augroup("CloseTerminal"),
  callback = function()
    if vim.v.event.status == 0 then
      vim.api.nvim_buf_delete(0, {})
    end
  end,
})

-- Tries to start treesitter for each filetype
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("StartTreesitter"),
  callback = function()
    pcall(vim.treesitter.start)
  end
})

