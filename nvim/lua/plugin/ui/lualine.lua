-- 状态栏

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        {
            "nvim-tree/nvim-web-devicons",
            opts = {},
        }
    },
    lazy = false,
    config = function()
        require('lualine').setup()
    end
}
