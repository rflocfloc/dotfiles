-- [[ Add Plugin ]]
vim.pack.add({
  { src = "https://github.com/ibhagwan/fzf-lua.git"},
  { src = "https://github.com/echasnovski/mini.icons.git"}
})


-- [[ Plugin Setup ]]
require("fzf-lua").setup({
  "fzf-vim",
  defaults = {file_icons = "mini"},
  winopts = {
    row              = 0.35,            -- window row position (0=top, 1=bottom)
    col              = 0.50,            -- window col position (0=left, 1=right)
    width = 0.5,
    height = 0.5,
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


-- [[ Keymaps ]]
vim.keymap.set('n', '<leader>sf',  '<cmd>FzfLua files<CR>' , {desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sb', '<cmd>FzfLua buffers<CR>', {desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<leader>sg', '<cmd>FzfLua live_grep<CR>', {desc = '[S]earch [G]rep' })
vim.keymap.set('n', '<leader>sw', '<cmd>FzfLua grep_cword<CR>', {desc = '[S]earch current [W]ord' })

