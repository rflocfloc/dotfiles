-- -------------
-- [[ OPTIONS ]]
-- -------------

local opt = vim.opt

-- Basic settings
opt.number = true                              -- Line numbers
opt.relativenumber = true                      -- Relative line numbers
opt.wrap = false                               -- Wrap lines
opt.mouse = "a"                                -- Enable mouse support
opt.inccommand = 'split'                       -- Preview substitutions live, as you type!
opt.confirm = true                          -- Confirm on exit

-- Indentation
opt.tabstop = 4                                -- Tab width
opt.softtabstog = 4                                -- Tab width
opt.shiftwidth = 4                             -- Indent width
opt.expandtab = true                           -- Use spaces instead of tabs
opt.breakindent = true                         -- Enable break indent

-- Search settings
opt.smartcase = true                          -- Case sensitive if uppercase in search
opt.path:append("**")                         -- Recursive find from nvim startup dir

-- Visual settings
opt.termguicolors = true                                      -- Enable 24-bit colors
opt.guicursor = ""
opt.signcolumn = "yes"                                        -- Always show sign column
opt.showmode = false                                            -- Show mode on command line
opt.list = true                                               -- Sets how neovim will display certain whitespace characters in the editor.
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- File handling
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"    -- undo dir
opt.undofile = true                                   -- Persistent undo
opt.updatetime = 300                           -- Faster completion
opt.timeoutlen = 500                           -- Key timeout duration

-- Split behavior
opt.splitbelow = true                          -- Horizontal splits go below
opt.splitright = true                          -- Vertical splits go right
