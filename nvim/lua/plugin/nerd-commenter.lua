-- 快速注释
-- 默认快捷键
-- <leader>cc 添加注释符
-- <leader>cu 删除注释符
-- <leader>c<space> 切换注释符
-- <leader>cA 行尾添加注释符并进入插入模式
-- <leader>cy 复制并添加注释符
-- <leader>ca 切换注释符种类

return{
    "preservim/nerdcommenter",
    event = "VeryLazy",
    config = function()
        vim.g.NERDDefaultAlign = 'left' 
        vim.g.NERDSpaceDelims = 1
    end,
}
