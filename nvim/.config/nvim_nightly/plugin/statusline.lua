-- Theme-aware enhanced statusline for plugin/statusline.lua

-- Helper function to get highlight group colors
local function get_hl_color(group, attr)
  local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
  if attr == 'fg' and hl.fg then
    return string.format('#%06x', hl.fg)
  elseif attr == 'bg' and hl.bg then
    return string.format('#%06x', hl.bg)
  end
  return nil
end

-- Helper function to extract colors from current theme
local function get_theme_colors()
  local colors = {}

  -- Get base colors from existing highlight groups
  colors.normal_bg = get_hl_color('StatusLine', 'bg') or get_hl_color('Normal', 'bg') or '#1a1b26'
  colors.normal_fg = get_hl_color('StatusLine', 'fg') or get_hl_color('Normal', 'fg') or '#c0caf5'
  colors.inactive_bg = get_hl_color('StatusLineNC', 'bg') or '#2a2a2a'
  colors.inactive_fg = get_hl_color('StatusLineNC', 'fg') or '#565f89'

  -- Try to get accent colors from common highlight groups
  colors.blue = get_hl_color('Function', 'fg') or get_hl_color('Identifier', 'fg') or '#7aa2f7'
  colors.green = get_hl_color('String', 'fg') or get_hl_color('Type', 'fg') or '#9ece6a'
  colors.purple = get_hl_color('Keyword', 'fg') or get_hl_color('Statement', 'fg') or '#bb9af7'
  colors.red = get_hl_color('Error', 'fg') or get_hl_color('ErrorMsg', 'fg') or '#f7768e'
  colors.orange = get_hl_color('Warning', 'fg') or get_hl_color('WarningMsg', 'fg') or '#e0af68'
  colors.cyan = get_hl_color('Special', 'fg') or get_hl_color('PreProc', 'fg') or '#7dcfff'
  colors.yellow = get_hl_color('Number', 'fg') or colors.orange

  -- Fallback to theme-specific colors if available
  local theme_name = vim.g.colors_name or ''
  if theme_name:find('catppuccin') then
    -- Catppuccin colors
    local ok, catppuccin = pcall(require, 'catppuccin.palettes')
    if ok then
      local palette = catppuccin.get_palette()
      if palette then
        colors.blue = palette.blue
        colors.green = palette.green
        colors.purple = palette.mauve
        colors.red = palette.red
        colors.orange = palette.peach
        colors.cyan = palette.sky
      end
    end
  elseif theme_name:find('tokyonight') then
    -- Tokyo Night colors (if available)
    local ok, tokyonight = pcall(require, 'tokyonight.colors')
    if ok then
      local theme_colors = tokyonight.setup()
      colors.blue = theme_colors.blue
      colors.green = theme_colors.green5
      colors.purple = theme_colors.purple
      colors.red = theme_colors.red
      colors.orange = theme_colors.orange
      colors.cyan = theme_colors.cyan
    end
  elseif theme_name:find('gruvbox') then
    -- Gruvbox-like detection
    colors.blue = get_hl_color('GruvboxBlue', 'fg') or colors.blue
    colors.green = get_hl_color('GruvboxGreen', 'fg') or colors.green
    colors.purple = get_hl_color('GruvboxPurple', 'fg') or colors.purple
    colors.red = get_hl_color('GruvboxRed', 'fg') or colors.red
    colors.orange = get_hl_color('GruvboxOrange', 'fg') or colors.orange
  end

  return colors
end

-- Create theme-aware highlight groups
local function setup_highlights()
  local colors = get_theme_colors()
  local dark_bg = colors.normal_bg
  local light_bg = colors.inactive_bg

  -- Mode colors - use theme accent colors
  vim.api.nvim_set_hl(0, "StModeNormal", { bg = colors.blue, fg = dark_bg, bold = true })
  vim.api.nvim_set_hl(0, "StModeInsert", { bg = colors.green, fg = dark_bg, bold = true })
  vim.api.nvim_set_hl(0, "StModeVisual", { bg = colors.purple, fg = dark_bg, bold = true })
  vim.api.nvim_set_hl(0, "StModeReplace", { bg = colors.red, fg = dark_bg, bold = true })
  vim.api.nvim_set_hl(0, "StModeCommand", { bg = colors.orange, fg = dark_bg, bold = true })

  -- Component colors - respect theme background/foreground
  vim.api.nvim_set_hl(0, "StFilename", { bg = light_bg, fg = colors.normal_fg, bold = true })
  vim.api.nvim_set_hl(0, "StModified", { bg = light_bg, fg = colors.red, bold = true })
  vim.api.nvim_set_hl(0, "StReadonly", { bg = light_bg, fg = colors.orange, bold = true })
  vim.api.nvim_set_hl(0, "StGit", { bg = colors.normal_bg, fg = colors.green })
  vim.api.nvim_set_hl(0, "StLsp", { bg = colors.normal_bg, fg = colors.purple })
  vim.api.nvim_set_hl(0, "StFiletype", { bg = colors.normal_bg, fg = colors.cyan })
  vim.api.nvim_set_hl(0, "StPosition", { bg = light_bg, fg = colors.normal_fg })
  vim.api.nvim_set_hl(0, "StPercent", { bg = colors.inactive_bg, fg = colors.normal_fg })
  vim.api.nvim_set_hl(0, "StError", { bg = colors.normal_bg, fg = colors.red })
  vim.api.nvim_set_hl(0, "StWarn", { bg = colors.normal_bg, fg = colors.orange })
  vim.api.nvim_set_hl(0, "StInfo", { bg = colors.normal_bg, fg = colors.blue })
end

-- Set up highlights on colorscheme change
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  callback = function()
    -- Add a small delay to ensure colorscheme is fully loaded
    vim.defer_fn(function()
      setup_highlights()
      vim.cmd('redrawstatus')
    end, 10)
  end,
})

-- Get current mode with colors (Global function)
function StatuslineGetMode()
  local modes = {
    ['n'] = { 'NORMAL', 'StModeNormal' },
    ['i'] = { 'INSERT', 'StModeInsert' },
    ['v'] = { 'VISUAL', 'StModeVisual' },
    ['V'] = { 'V-LINE', 'StModeVisual' },
    [''] = { 'V-BLOCK', 'StModeVisual' },
    ['c'] = { 'COMMAND', 'StModeCommand' },
    ['R'] = { 'REPLACE', 'StModeReplace' },
    ['r'] = { 'REPLACE', 'StModeReplace' },
    ['s'] = { 'SELECT', 'StModeVisual' },
    ['S'] = { 'S-LINE', 'StModeVisual' },
    [''] = { 'S-BLOCK', 'StModeVisual' },
    ['t'] = { 'TERMINAL', 'StModeInsert' },

}
  local mode = vim.api.nvim_get_mode().mode
  local mode_info = modes[mode] or { 'TERMINAL', 'StModeInsert' }

  return string.format('%%#%s# %s %%*', mode_info[2], mode_info[1])
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
    yaml = '嗀',
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
  local ok, result = pcall(string.format, '%%#StFilename# [%d/%d] %%*', current_arg, arglist_size)
  return ok and result or ''
end

-- Build the complete statusline - Global function
function StatuslineBuild()
  local parts = {
    '%{%v:lua.StatuslineGetMode()%}',
    '%{%v:lua.StatuslineGetFilename()%}',
    '%{%v:lua.StatuslineGetArglist()%}',
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
vim.opt.showmode = false

-- Set up initial highlights
setup_highlights()

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
