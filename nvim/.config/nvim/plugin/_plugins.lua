-- ----------------
-- [[ PLUGINS ]]
-- ----------------

-- Add plugins
vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig.git"},                              -- LSP presets
  { src = "https://github.com/mason-org/mason.nvim.git"},                               -- LSP installer
  { src = "https://github.com/nvim-treesitter/nvim-treesitter.git" },                   -- treesitter presets
  -- { src = "https://github.com/Saghen/blink.cmp.git", version = "1.*"},                                   -- Autocompletition
  { src = "https://github.com/mfussenegger/nvim-ansible.git"},                          -- LSP/treesitter syntax for ansible
  { src = "https://github.com/ibhagwan/fzf-lua.git", priority = 1000},                  -- fuzzy finder
  { src = "https://github.com/echasnovski/mini.icons.git"},                             -- icons
  -- { src = "https://github.com/nvim-lualine/lualine.nvim.git", priority = 1000},         -- status line
  { src = "https://github.com/vague2k/vague.nvim", priority = 1000},                    -- colorscheme
})

-- Setup plugins
require("mason").setup({
  ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("nvim-treesitter").setup({
  -- Treesitter, used for language highlights
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "yaml", "toml" },
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
})

-- require("blink.cmp").setup({
--   fuzzy = { implementation = "lua"},
--   signature = {enabled = true},
--   completion = {
--     documentation = {
--       auto_show = true,
--       auto_show_delay_ms = 200},
--   },
--   sources = {default = {'lsp'}}
-- })
--
require("fzf-lua").setup({
  "fzf-vim",
  defaults = {file_icons = "mini"},
  winopts = {
    row              = 0.35,            -- window row position (0=top, 1=bottom)
    col              = 0.50,            -- window col position (0=left, 1=right)
    width = 0.6,
    height = 0.6,
    title_pos = "center",
    preview = {
      default = "bat",
      border         = "rounded",       -- preview border: accepts both `nvim_open_win`
                                        -- and fzf values (e.g. "border-top", "none")
      wrap           = false,           -- preview line wrap (fzf's 'wrap|nowrap')
      hidden         = true,           -- start preview hidden
      vertical       = "top:90%",      -- up|down:size
      horizontal     = "right:90%",     -- right|left:size
      layout         = "vertical",          -- horizontal|vertical|flex
      flip_columns   = 100,             -- #cols to switch to horizontal on flex
      -- Only used with the builtin previewer:
      title          = true,            -- preview border title (file/buf)?
      title_pos      = "center",        -- left|center|right, title alignment
      scrollbar      = "float",         -- `false` or string:'float|border'
    }
  },
  keymap = {
    fzf = {
      ["ctrl-p"] = "toggle-preview",
      ["ctrl-j"]  = "preview-page-down",
      ["ctrl-k"]    = "preview-page-up",
    }
  },
  previewers = {
    builtin = {
      syntax_limit_b = 1024 * 100, -- 100KB
    },
  },
  files = { prompt = "Files> ", cwd_prompt = false},
  buffers = { prompt = 'Buffers> ', ignore_current_buffer = true, sort_lastused = true },
  grep = {
    prompt = "Grep> ",
    rg_glob = true, -- enable glob parsing
    glob_flag = "--iglob", -- case insensitive globs
    glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
  },
})

-- require("lualine").setup({
--   icons_enabled = true,
--   theme = 'auto',
--   options = {
--     component_separators = "",
--     section_separators = { left = " ", right = " " },
--   },
--
--   sections = {
--     lualine_a = { { "mode",  right_padding = 2 } },
--     lualine_b = {'branch', 'diff', 'diagnostics'},
--     lualine_c = { "filename" },
--     lualine_x = {"lsp_status"},
--     lualine_y = {"filesize", "filetype"},
--     lualine_z = {
--       { "progress", separator = " ", padding = { left = 1, right = 0 } },
--       { "location", padding = { left = 0, right = 1 } },
--     },
--   },
-- })


require("vague").setup({})
