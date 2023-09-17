-- 代码高亮
return {
    "nvim-treesitter/nvim-treesitter",
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
            },
            auto_install = true,
        }
    end,
}
