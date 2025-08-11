# Neovim Dotfiles
Configuration files for setting up neovim.

Clone directory to your `~/.config/nvim`.

## System Dependencies
Required packages:
- `nvim` (0.12+) -- Uses `vim.pack`
- `lua`
- `npm` (for Mason/LSP install)
- `fzf` (for fzf-lua)
- `bat` (for fzf-lua preview)

## LSP install
LSP must be installed manually. Mason is installed therefore you can check the available ones with ` :Mason `
And install them with ` :MasonInstall <package name> `.

Otherwise remove Mason and install them at user/system level. Once installed LSP should be **enabled** (check lua/plugins/lsp.lua).
