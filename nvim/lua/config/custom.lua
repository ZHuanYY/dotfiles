-- 重映射 *.h 文件类型为 c
vim.cmd [[
    augroup h_to_c
        autocmd!
        autocmd BufReadPre *.h setlocal filetype=c
    augroup end ]]

-- 当前失去焦点时保存
vim.cmd [[
    augroup autosave
        autocmd!
        autocmd BufLeave * silent! wall 
]]
