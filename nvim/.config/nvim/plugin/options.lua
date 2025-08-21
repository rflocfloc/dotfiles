-- Basic settings
vim.o.number = true                              -- Line numbers
vim.o.relativenumber = true                      -- Relative line numbers
vim.o.cursorline = false                          -- Highlight current line
vim.o.wrap = false                               -- Wrap lines
vim.o.scrolloff = 10                             -- Keep 10 lines above/below cursor 
vim.o.sidescrolloff = 8                          -- Keep 8 columns left/right of cursor

-- Indentation
vim.o.tabstop = 1                                -- Tab width
vim.o.shiftwidth = 2                             -- Indent width
vim.o.softtabstop = 2                            -- Soft tab stop
vim.o.expandtab = true                           -- Use spaces instead of tabs
vim.o.smartindent = true                         -- Smart auto-indenting
vim.o.autoindent = true                          -- Copy indent from current line
vim.o.breakindent = true                           -- Enable break indent

-- Search settings
vim.o.ignorecase = true                          -- Case insensitive search
vim.o.smartcase = true                           -- Case sensitive if uppercase in search
vim.o.hlsearch = true                           -- Don't highlight search results 
vim.o.incsearch = true                           -- Show matches as you type
vim.o.path = vim.o.path .. ",**"                -- Recursive find

-- Visual settings
vim.o.termguicolors = true                       -- Enable 24-bit colors
vim.o.signcolumn = "yes"                         -- Always show sign column
vim.o.showmatch = true                           -- Highlight matching brackets
vim.o.matchtime = 2                              -- How long to show matching bracket
vim.o.cmdheight = 1                              -- Command line height
vim.o.completeopt = "menuone,noinsert,noselect,fuzzy"  -- Completion options 
vim.o.list = true                                  -- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- vim.o.winborder = "rounded"                        -- border of popup windows (like hover)

-- File handling
vim.o.undofile = true                            -- Persistent undo
vim.o.updatetime = 300                           -- Faster completion
vim.o.timeoutlen = 500                           -- Key timeout duration
vim.o.autoread = true                            -- Auto reload files changed outside vim

-- Behavior settings
vim.o.errorbells = false                         -- No error bells
vim.o.backspace = "indent,eol,start"             -- Better backspace behavior
vim.o.mouse = "a"                                -- Enable mouse support
vim.o.encoding = "UTF-8"                         -- Set encoding
vim.o.inccommand = 'split'                         -- Preview substitutions live, as you type!
-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)                  -- sync clipboard with system clipboard

-- Split behavior
vim.o.splitbelow = true                          -- Horizontal splits go below
vim.o.splitright = true                          -- Vertical splits go right

-- Performance improvements
vim.o.redrawtime = 10000
vim.o.maxmempattern = 20000

-- File Browsing settings (Netrw)
vim.g.netrw_banner = 0             -- Disables the banner at the top of the netrw window to save space.
vim.g.netrw_liststyle = 3          -- Changes the display to a tree-style view, which is easier to navigate.
vim.g.netrw_showhidden = 1         -- Shows hidden files (those that start with a dot, like .config) by default.
vim.g.netrw_winsize = 20           -- Sets the netrw window's width to 20% of the screen.
