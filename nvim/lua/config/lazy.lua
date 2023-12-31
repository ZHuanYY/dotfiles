local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "theme" },
        { import = "plugin" },
        { import = "plugin.ui" },
        { import = "plugin.project" },
    },

    defaults = {
        lazy = true, -- 默认使用懒加载
        version = false,
    },

    -- 自动检查插件更新
    checker = { enabled = false }
})
