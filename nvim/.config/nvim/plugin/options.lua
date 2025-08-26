-- -------------
-- [[ OPTIONS ]]
-- -------------

-- Basic settings
vim.opt.number = true                              -- Line numbers
vim.opt.relativenumber = true                      -- Relative line numbers
vim.opt.wrap = false                               -- Wrap lines
vim.opt.scrolloff = 10                             -- Keep 10 lines above/below cursor 
vim.opt.sidescrolloff = 8                          -- Keep 8 columns left/right of cursor
vim.opt.mouse = "a"                                -- Enable mouse support
vim.opt.inccommand = 'split'                       -- Preview substitutions live, as you type!
vim.opt.confirm = true                          -- Confirm on exit

-- Indentation
vim.opt.tabstop = 4                                -- Tab width
vim.opt.shiftwidth = 4                             -- Indent width
vim.opt.softtabstop = 4                            -- Soft tab stop
vim.opt.expandtab = true                           -- Use spaces instead of tabs
vim.opt.breakindent = true                         -- Enable break indent

-- Search settings
vim.opt.smartcase = true                          -- Case sensitive if uppercase in search
vim.opt.path:append("**")                         -- Recursive find from nvim startup dir

-- Visual settings
vim.opt.termguicolors = true                                      -- Enable 24-bit colors
vim.opt.guicursor = ""
vim.opt.signcolumn = "yes"                                        -- Always show sign column
vim.opt.showmode = false                                            -- Show mode on command line
vim.opt.complete.opt = {"menuone","noinsert","noselect"}           -- Completion vim.options
vim.opt.list = true                                               -- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- File handling
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"    -- undo dir
vim.opt.undofile = true                                   -- Persistent undo
vim.opt.updatetime = 300                           -- Faster completion
vim.opt.timeoutlen = 500                           -- Key timeout duration

-- Split behavior
vim.opt.splitbelow = true                          -- Horizontal splits go below
vim.opt.splitright = true                          -- Vertical splits go right

-- File Brower settings (Netrw)
vim.g.netrw_banner = 0                          -- Disables the banner at the top of the netrw window to save space.
vim.g.netrw_liststyle = 3                       -- Changes the display to a tree-style view, which is easier to navigate.
vim.g.netrw_showhidden = 1                      -- Shows hidden files (those that start with a dot, like .config) by default.
vim.g.netrw_winsize = 20                        -- Sets the netrw window's width to 20% of the screen.
