local cmp = {} -- statusline components

-- status bar colors
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  callback = function()
    vim.api.nvim_set_hl(0, "StatusLineNormal", { bg = "#252530", fg ="#a6adc8", bold = true })
    vim.api.nvim_set_hl(0, "StatusLineInsert", { bg = "#99b782", fg ="#1e1e2e", bold = true })
    vim.api.nvim_set_hl(0, "StatusLineVisual", { bg = "#c9b1ca", fg ="#1e1e2e", bold = true })
    vim.api.nvim_set_hl(0, "StatusLineReplace", { bg = "#e08398", fg ="#1e1e2e", bold = true })
    vim.api.nvim_set_hl(0, "StatusLineCommand", { bg = "#f3be7c", fg ="#1e1e2e", bold = true })
    vim.api.nvim_set_hl(0, "StatusLineTerminal", { bg = "#e08398", fg ="#1e1e2e", bold = true })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "#4f5258", fg ="#cdcdcd", bold = true })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#1c1c1c", fg ="#cdcdcd", bold = true })
  end,
})

local hi_pattern = '%%#%s#%s%%*'

function cmp.position()
  return hi_pattern:format('StatusLineNormal',' %3l:%-2c ')
end

function cmp.lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then return "  [none] " end
  local names = {}
  for _, c in pairs(clients) do
    table.insert(names, c.name)
  end
  return " " .. table.concat(names, ", ")
end

function cmp.get_mode_name()
  local mode = vim.api.nvim_get_mode().mode
  local mode_names = {
    ['n'] = hi_pattern:format('StatusLineNormal', ' N '),
    ['i'] = hi_pattern:format('StatusLineInsert',' I '),
    ['v'] = hi_pattern:format('StatusLineVisual',' V '),
    ['V'] = hi_pattern:format('StatusLineVisual',' V '),
    ['R'] = hi_pattern:format('StatusLineReplace',' R '),
    ['c'] = hi_pattern:format('StatusLineCommand',' C '),
    ['t'] = hi_pattern:format('StatusLineTerm',' T '),
    [''] = hi_pattern:format('StatusLineNormal', ' N '),    -- fallback normal
  }
  return mode_names[mode] or ' '
end

function cmp.arglist()
  local arglist_size = vim.fn.argc()
  if arglist_size == 0 then
    return hi_pattern:format('StatusLine', '')  -- Different color
  end
  local current_arg = vim.fn.argidx() + 1
  return hi_pattern:format('StatusLineNormal', string.format(' [%d/%d] ', current_arg, arglist_size))
end

function _G._statusline_component(name)
  return cmp[name]()
end

local statusline = {
  '%{%v:lua._statusline_component("get_mode_name")%}',
  '%{%v:lua._statusline_component("arglist")%}',
  ' %t',
  '%r',
  '%m',
  '%=',
  '%{%v:lua._statusline_component("lsp_status")%} ',
  ' %{&filetype} ',
  ' %2p%% ',
  '%{%v:lua._statusline_component("position")%}'
}

vim.opt.statusline = table.concat(statusline, '')
