-- Theme-aware enhanced statusline for plugin/statusline.lua

-- Get current mode with colors (Global function)
function StatuslineGetMode()
  local modes = {
    ['n'] = { 'N'},
    ['i'] = { 'I'},
    ['v'] = { 'V'},
    ['V'] = { 'V'},
    [''] = { 'V'},
    ['c'] = { 'C'},
    ['R'] = { 'R'},
    ['r'] = { 'R'},
    ['s'] = { 'S'},
    ['S'] = { 'S'},
    [''] = { 'S'},
    ['t'] = { 'T'},

}
  local mode = vim.api.nvim_get_mode().mode
  local mode_info = modes[mode] or { 'TERMINAL'}

  return string.format('%%#%s#- %s - %%*', mode_info[2], mode_info[1])
end

-- Get filename with path intelligence (Global function)
function StatuslineGetFilename()
  local filename = vim.fn.expand('%:t')
  local filepath = vim.fn.expand('%:~:.:h')

  if filename == '' then
    return '%#StFilename# [No Name] %*'
  end

  local result = '%#StFilename# '

  -- Show relative path if not in current directory
  if filepath ~= '.' and filepath ~= '' then
    result = result .. filepath .. '/'
  end

  result = result .. filename .. ' %*'

  -- Add modified flag
  if vim.bo.modified then
    result = result .. '%#StModified#● %*'
  end

  -- Add readonly flag
  if vim.bo.readonly then
    result = result .. '%#StReadonly# %*'
  end

  return result
end

-- Get LSP status (safe version) - Global function
function StatuslineGetLspStatus()
  -- Check if LSP is available at all
  if not vim.lsp then
    return ''
  end

  -- Check if get_clients function exists (newer API)
  local clients = {}
  local get_clients_ok = false

  if vim.lsp.get_clients then
    get_clients_ok, clients = pcall(vim.lsp.get_clients, { bufnr = 0 })
  elseif vim.lsp.buf_get_clients then
    -- Fallback for older Neovim versions
    get_clients_ok, clients = pcall(vim.lsp.buf_get_clients, 0)
  end

  if not get_clients_ok or not clients or #clients == 0 then
    return ''
  end

  local names = {}
  for _, client in pairs(clients) do
    if client.name then
      table.insert(names, client.name)
    end
  end

  if #names == 0 then
    return ''
  end

  return '%#StLsp# LSP:' .. table.concat(names, ',') .. ' %*'
end

-- Get diagnostics count (safe version) - Global function
function StatuslineGetDiagnostics()
  -- Check if diagnostics API is available
  if not vim.diagnostic or not vim.diagnostic.get then
    return ''
  end

  local ok, diagnostics = pcall(vim.diagnostic.get, 0)
  if not ok or not diagnostics then
    return ''
  end

  local counts = { errors = 0, warnings = 0, info = 0, hints = 0 }

  -- Check if severity constants are available
  local severity = vim.diagnostic.severity
  if not severity then
    return ''
  end

  for _, diagnostic in pairs(diagnostics) do
    if diagnostic.severity == severity.ERROR then
      counts.errors = counts.errors + 1
    elseif diagnostic.severity == severity.WARN then
      counts.warnings = counts.warnings + 1
    elseif diagnostic.severity == severity.INFO then
      counts.info = counts.info + 1
    elseif diagnostic.severity == severity.HINT then
      counts.hints = counts.hints + 1
    end
  end

  local result = ''
  if counts.errors > 0 then
    result = result .. '%#StError# E:' .. counts.errors .. ' %*'
  end
  if counts.warnings > 0 then
    result = result .. '%#StWarn# W:' .. counts.warnings .. ' %*'
  end
  if counts.info > 0 then
    result = result .. '%#StInfo# I:' .. counts.info .. ' %*'
  end

  return result
end

-- Get file encoding and format - Global function
function StatuslineGetFileInfo()
  local encoding = vim.bo.fileencoding
  if encoding == '' then
    encoding = vim.o.encoding
  end

  local format = vim.bo.fileformat
  local result = ''

  if encoding ~= 'utf-8' then
    result = result .. encoding .. ' '
  end

  if format ~= 'unix' then
    result = result .. format .. ' '
  end

  return result ~= '' and ' ' .. result or ''
end

-- Get filetype with icon - Global function
function StatuslineGetFiletype()
  local ft = vim.bo.filetype
  if ft == '' then return '' end

  -- Simple icon mapping
  local icons = {
    lua = '',
    vim = '',
    python = '',
    javascript = '',
    typescript = '',
    html = '',
    css = '',
    json = '',
    yaml = '',
    markdown = '',
    sh = '',
    zsh = '',
    fish = '',
    rust = '',
    go = '',
    c = '',
    cpp = '',
  }

  local icon = icons[ft] or ''
  return '%#StFiletype# ' .. icon .. ' ' .. ft .. ' %*'
end

-- Get search count - Global function
function StatuslineGetSearchCount()
  if vim.v.hlsearch == 0 then return '' end

  local ok, search = pcall(vim.fn.searchcount, { maxcount = 999 })
  if not ok or search.total == 0 then return '' end

  if search.incomplete == 1 then
    return ' [?/?] '
  end

  return string.format(' [%d/%d] ', search.current, search.total)
end

-- Get Arglist info
function StatuslineGetArglist()
  -- Ultra-safe version with extensive error handling
  local function safe_call(func, ...)
    local ok, result = pcall(func, ...)
    return ok and result or nil
  end

  -- Check if we even have vim.fn
  if not vim or not vim.fn then
    return ''
  end

  local arglist_size = safe_call(vim.fn.argc)
  if not arglist_size or type(arglist_size) ~= 'number' or arglist_size <= 0 then
    return ''
  end

  local current_idx = safe_call(vim.fn.argidx)
  if not current_idx or type(current_idx) ~= 'number' then
    return ''
  end

  -- Validate range
  if current_idx < 0 or current_idx >= arglist_size then
    return ''
  end

  local current_arg = current_idx + 1

  -- Final sanity check
  if current_arg < 1 or current_arg > arglist_size or current_arg > 9999 then
    return ''
  end

  -- Safe string formatting
  local ok, result = pcall(string.format, '%%#StFilename#[%d/%d] %%*', current_arg, arglist_size)
  return ok and result or ''
end

-- Build the complete statusline - Global function
function StatuslineBuild()
  local parts = {
    -- '%{%v:lua.StatuslineGetMode()%}',
    '%{%v:lua.StatuslineGetArglist()%}',
    '%{%v:lua.StatuslineGetFilename()%}',
    '%<', -- Truncate here if needed
    '%=', -- Switch to right side
    '%{%v:lua.StatuslineGetDiagnostics()%}',
    '%{%v:lua.StatuslineGetLspStatus()%}',
    '%{%v:lua.StatuslineGetFileInfo()%}',
    '%{%v:lua.StatuslineGetFiletype()%}',
    '%{%v:lua.StatuslineGetSearchCount()%}',
    '%#StPosition# %3l:%-2c %*',
    '%#StPercent# %3p%% %*',
  }

  return table.concat(parts, '')
end

-- Set up the statusline
vim.opt.statusline = '%!v:lua.StatuslineBuild()'
vim.opt.showmode = true

-- Set up initial highlights
-- setup_highlights()

-- Refresh on various events
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'DirChanged' }, {
  callback = function()
    vim.cmd('redrawstatus')
  end,
})

-- Optional: Add a command to reload statusline
vim.api.nvim_create_user_command('StatuslineReload', function()
  vim.opt.statusline = '%!v:lua.StatuslineBuild()'
  vim.cmd('redrawstatus')
end, { desc = 'Reload statusline' })
