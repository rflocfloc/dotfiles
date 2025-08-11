" -----------------
" [[ Colorscheme ]]
" -----------------
colorscheme retrobox

" -------------
" [[ Keymaps ]]
" -------------
" Set leader key to Space
let mapleader = ' '

" Use CTRL+<hjkl> to switch between windows
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

" Move between buffers keymaps
nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>

" Use Alt+<hjkl> to move lines (Normal mode)
nnoremap <silent> <A-h> <<
nnoremap <silent> <A-l> >>
nnoremap <silent> <A-j> :m +1<CR>==
nnoremap <silent> <A-k> :m -2<CR>==

" Use Alt+<hjkl> to move lines (Visual and Block mode)
xnoremap <silent> <A-h> <gv
xnoremap <silent> <A-l> >gv
xnoremap <silent> <A-j> :m '>+1<CR>gv=gv
xnoremap <silent> <A-k> :m '<-2<CR>gv=gv

" Clear highlights on search when pressing <Esc> in normal mode
nnoremap <leader>c :nohlsearch<CR>

" Delete to blackhole register (not saved in yank)
nnoremap <leader>d "_d
xnoremap <leader>d "_d

" Replace selection in file
xnoremap <leader>r "hy:%s/<C-r>h//g<left><left>

" -------------
" [[ Options ]]
" -------------
" Basic settings
set number                                    " Line numbers
set relativenumber                            " Relative line numbers
set nocursorline                              " Highlight current line
set nowrap                                    " Wrap lines
set scrolloff=10                              " Keep 10 lines above/below cursor 
set sidescrolloff=8                           " Keep 8 columns left/right of cursor

" Indentation
set tabstop=1                                 " Tab width
set shiftwidth=2                              " Indent width
set softtabstop=2                             " Soft tab stop
set expandtab                                 " Use spaces instead of tabs
set smartindent                               " Smart auto-indenting
set autoindent                                " Copy indent from current line
set breakindent                               " Enable break indent

" Search settings
set ignorecase                            " Case insensitive search
set smartcase                             " Case sensitive if uppercase in search
set hlsearch                              " Don't highlight search results 
set incsearch                             " Show matches as you type

" Visual settings
set termguicolors                        " Enable 24-bit colors
set signcolumn=auto                           " Always show sign column
set showmatch                            " Highlight matching brackets
set matchtime=2                          " How long to show matching bracket
set cmdheight=1                          " Command line height
set showmode                              " show mode in command line (like '<'>)

" File handling
set undofile                             " Persistent undo
set updatetime=300                           " Faster completion
set timeoutlen=500                           " Key timeout duration
set autoread                             " Auto reload files changed outside vim

" Behavior settings
set noerrorbells                              " No error bells
set backspace=indent,eol,start             " Better backspace behavior
set mouse=a                                " Enable mouse support
set splitbelow                           " Horizontal splits go below
set splitright                           " Vertical splits go right

