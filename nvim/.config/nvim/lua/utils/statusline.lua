vim.cmd([[
highlight StatusLineNormal guibg=#1e1e2e guifg=#a6adc8
highlight StatusLineInsert guibg=#40a02b guifg=#1e1e2e
highlight StatusLineVisual guibg=#8839ef guifg=#1e1e2e
highlight StatusLineReplace guibg=#d20f39 guifg=#1e1e2e
highlight StatusLineCommand guibg=#df8e1d guifg=#1e1e2e
highlight StatusLineTerminal guibg=#179299 guifg=#1e1e2e
highlight StatusLine       guibg=#303446 guifg=#c6d0f5
]])

local mode_colors = {
  n = "%#StatusLineNormal#",
  i = "%#StatusLineInsert#",
  v = "%#StatusLineVisual#",
  V = "%#StatusLineVisual#",
  ["\22"] = "%#StatusLineVisual#",
  c = "%#StatusLineCommand#",
  R = "%#StatusLineReplace#",
  t = "%#StatusLineTerminal#",
}

local mode_names = {
  n = "NORMAL",
  i = "INSERT",
  v = "VISUAL",
  V = "V-LINE",
  ["\22"] = "V-BLOCK",
  c = "COMMAND",
  R = "REPLACE",
  t = "TERMINAL",
}

local function lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then return "LSP: Off" end
  local names = {}
  for _, c in pairs(clients) do table.insert(names, c.name) end
  return "LSP: " .. table.concat(names, ", ")
end

function _G.statusline()
  -- No mode section now

  local filename = vim.fn.expand("%:t") ~= "" and vim.fn.expand("%:t") or "[No File]"
  local filetype = vim.bo.filetype ~= "" and vim.bo.filetype or "none"
  local cursor = "Ln " .. vim.fn.line(".") .. ", Col " .. vim.fn.col(".")

  -- Left side: just filename now
  local left = " " .. filename .. " "

  -- Right side info
  local right = string.format(" %s | %s | %s ", lsp_status(), filetype, cursor)

  -- Calculate padding to push right section to the right
  local width = vim.api.nvim_win_get_width(0)
  local len_left = vim.fn.strdisplaywidth(left)
  local len_right = vim.fn.strdisplaywidth(right)
  local padding = width - len_left - len_right
  if padding < 1 then padding = 1 end

  return left .. string.rep(" ", padding) .. right
end

vim.opt.statusline = "%!v:lua.statusline()"

