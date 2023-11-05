-- 重映射 *.h 文件类型为 c
vim.cmd [[
    augroup h_to_c
        autocmd!
        autocmd BufReadPre *.h setlocal filetype=c
    augroup end ]]
