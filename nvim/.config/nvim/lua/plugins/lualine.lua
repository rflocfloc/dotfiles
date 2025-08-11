-- [[ Add Plugin ]]
vim.pack.add({
  { src = "https://github.com/nvim-lualine/lualine.nvim.git", priority = 1000},
})

-- [[ Plugin Setup ]]
require("lualine").setup({
  icons_enabled = true,
  theme = 'auto',
  options = {
    component_separators = "",
    section_separators = { left = " ", right = " " },
  },

  sections = {
    lualine_a = { { "mode",  right_padding = 2 } },
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = { "filename" },
    lualine_x = {"lsp_status", "filesize", "filetype"},
    lualine_y = {
      { "progress", separator = " ", padding = { left = 1, right = 0 } },
      { "location", padding = { left = 0, right = 1 } },
    },
    lualine_z = {
      {
        function()
          return " " .. os.date("%R")
        end,
      },
    },
  },
})

