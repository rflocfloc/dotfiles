-- [[ Add Plugin ]]
vim.pack.add({
  { src = "https://github.com/wnkz/monoglow.nvim.git", priority = 1000},
  { src = "https://github.com/rose-pine/neovim.git", priority = 1000, name="rose-pine"},
  { src = "https://github.com/vague2k/vague.nvim.git", priority = 1000},
})

-- [[ Enable colorscheme ]]
vim.o.background = 'dark'
vim.cmd.colorscheme 'vague'
