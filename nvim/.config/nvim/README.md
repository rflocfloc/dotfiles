# Neovim Dotfiles
Configuration files for setting up neovim.

Clone directory to your `~/.config/nvim`.

## System Dependencies
Required packages:
- `nvim` (0.11+) -- Uses `pack` directory
- `lua`
- `npm` (for `Mason`/LSP install)
- `fzf` (for `fzf-lua`)
- `bat` (for `fzf-lua` preview)

## LSP install
LSP must be installed manually. `Mason` is installed therefore you can check the available ones with ` :Mason `
And install them with ` :MasonInstall <package name> `.

Otherwise remove `Mason` and install them at user/system level. Once installed LSP should be **enabled** (check lua/plugins/lsp.lua). If `nvim-lspconfig` not installed, manual LSP configuration files should be added for each language server into a directory `lsp` ( automatically recognized by nvim ).

## Config structure
The main configuration places of nvim configuration are:

- `init.lua` the main entry point of Neovim configuration. It is executed at start time and it acts as the *central hub*. External plugins must be specified in here to be loaded.
- `plugin/` directory is for global plugins or scripts to be sourced every time Neovim starts, regardless of the file type. Some examples:

    * `keymaps`, containing custom mappings
    * `options`, global options of the editor
    * `autocmds`, commands that respond to global events
    * `lsp`, LSP options and *enabling*

- `after/ftplugin/` directory is for **filetype-specific** plugins and settings. Files placed here are only loaded when you open a file of the corresponding type.
- `lua/` designed for *modular Lua-based configuration*. These files
  **must be added** in `init.lua` or `plugin/` to be loaded. External
  plugins config are stored here.

The names of directories `plugin`, and `ftplugin` ( and if added `lsp`, `syntax`, `after`) are hardcoded into Neovim's runtime path mechanism. The `lua` directory is a recognized path by `lua language` for its scripts.

Configuration structure example.
```shell
.
├── ftplugin
│   ├── python.lua
│   └── yaml.lua
├── init.lua
├── lua
│   └── plugins
│       ├── plugin1.lua
│       └── plugin2.lua
├── plugin
│   ├── autocmds.lua
│   ├── keymaps.lua
│   └── options.lua
└── README.md
```
