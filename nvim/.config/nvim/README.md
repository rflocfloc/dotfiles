# Neovim Dotfiles
Configuration files for setting up neovim.

Clone directory to your `~/.config/nvim`.

>[!IMPORTANT]
> Add to `.bashrc` appname variable specifying which nvim dir to use
> e.g. `NVIM_APPNAME="nvim/default"`

## System Dependencies
Required default packages:
- `nvim` (0.11+)
- `lua`
- `fd`
- `ripgrep`

Optional packages depending on dir used:
- `npm` (for `Mason`/LSP install)
- `fzf` (for `fzf-lua`)
- `bat` (for `fzf-lua` preview)

## LSP install
LSP must be installed manually. `Mason` is installed therefore you can check the available ones with ` :Mason `
And install them with ` :MasonInstall <package name> `.

Otherwise remove `Mason` and install them at user/system level. Once installed LSP should be **enabled** (check lua/plugins/lsp.lua). If `nvim-lspconfig` not installed, manual LSP configuration files should be added for each language server into a directory `lsp` ( automatically recognized by nvim ).
