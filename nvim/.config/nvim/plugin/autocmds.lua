-- ------------------
-- [[ AUTOCOMMANDS ]]
-- ------------------

local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
    return vim.api.nvim_create_augroup("UserConfig_" .. name, { clear = true })
end

autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = augroup('HighlightText'),
    callback = function()
        vim.hl.on_yank()
    end,
})

autocmd("BufWritePre", {
    desc = 'Remove end of line whitespaces on writing',
    group = augroup('RemoveWhitespaces'),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd({ "VimResized" }, {
    desc = 'Resize splits if window is resized',
    group = augroup("ResizeSplits"),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    desc = 'Check if reload is needed when changing file',
    group = augroup("CheckFile"),
    callback = function()
        if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
        end
    end,
})

autocmd("FileType", {
    desc = 'Starts treesitter on each filetype',
    group = augroup("StartTreesitter"),
    callback = function()
        pcall(vim.treesitter.start)
    end
})
