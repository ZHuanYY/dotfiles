-- 快捷键提示
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    config = function()
        local wk = require("which-key")
        wk.setup()
        wk.register{
            ["<leader>nh"] = "取消高亮",
            ["<c-j>"] = "下方插入一行",
            ["<c-k>"] = "上方插入一行",
        }
    end
}
