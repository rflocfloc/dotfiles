-- function _G.FdFindFiles(cmdarg, _cmdcomplete)
--   local fnames = vim.fn.systemlist("fd --hidden --type f")
--     if #cmdarg == 0 then
--         return fnames
--     else
--         return vim.fn.matchfuzzy(fnames, cmdarg)
--     end
-- end
--
-- if vim.fn.executable "fd" == 1 then
--     vim.o.findfunc = 'v:lua.FdFindFiles'
-- end
--
local M = {}

-- Cache for files
local files_cache = {}

-- Reset cache when entering command line
vim.api.nvim_create_augroup('CmdCompleteResetFind', { clear = true })
vim.api.nvim_create_autocmd('CmdlineEnter', {
  group = 'CmdCompleteResetFind',
  pattern = ':',
  callback = function()
    files_cache = {}
  end
})

-- Function to determine which command to use for finding files
local function find_cmd()
  local cmd = ''

  if vim.fn.executable('fd') == 1 then
    cmd = 'fd . --path-separator / --type f --hidden --follow --exclude .git'
  elseif vim.fn.executable('fdfind') == 1 then
    cmd = 'fdfind . --path-separator / --type f --hidden --follow --exclude .git'
  elseif vim.fn.executable('rg') == 1 then
    cmd = 'rg --path-separator / --files --hidden --glob !.git'
  elseif vim.fn.executable('find') == 1 then
    cmd = 'find \\! \\( -path "*/.git" -prune -o -name "*.swp" \\) -type f -follow'
  end

  return cmd
end

-- Main find function
function M.find(cmd_arg, cmd_complete)
  if vim.tbl_isempty(files_cache) then
    local cmd = find_cmd()

    if cmd == '' then
      -- Fallback to globpath equivalent
      local files = vim.fn.globpath('.', '**', true, true)
      files_cache = {}

      for _, file in ipairs(files) do
        if vim.fn.isdirectory(file) == 0 then
          -- Remove leading ./ from path
          local clean_path = string.gsub(file, '^%./', '')
          table.insert(files_cache, clean_path)
        end
      end
    else
      files_cache = vim.fn.systemlist(cmd)
    end
  end

  if cmd_arg == '' or cmd_arg == nil then
    return files_cache
  else
    return vim.fn.matchfuzzy(files_cache, cmd_arg)
  end
end

-- Set the find function globally so it can be used by Vim
_G.Find = M.find

-- Set the findfunc option
vim.opt.findfunc = 'v:lua.Find'

return M
