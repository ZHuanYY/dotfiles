-- 代码高亮
return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = "HiPhish/nvim-ts-rainbow2",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "c",
                "lua",
                "rust",
                "json",
                "cmake",
                "glsl",
                "markdown",
                "markdown_inline",
                "toml",
                "xml"
            },
            auto_install = true,
            rainbow = {
                enable = true,
                disable = {},
                query = 'rainbow-parens',
                strategy = require('ts-rainbow').strategy.global,
            },
        }
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    end,
}
