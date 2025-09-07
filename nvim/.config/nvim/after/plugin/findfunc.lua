function _G.FdFindFiles(cmdarg, _cmdcomplete)
  local fnames = vim.fn.systemlist("fd --hidden --type f")
    if #cmdarg == 0 then
        return fnames
    else
        return vim.fn.matchfuzzy(fnames, cmdarg)
    end
end

if vim.fn.executable "fd" == 1 then
    vim.o.findfunc = 'v:lua.FdFindFiles'
end

