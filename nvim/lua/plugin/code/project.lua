-- 项目管理
return {
    "ahmedkhalf/project.nvim",
    dependencies = {
        "pocco81/auto-save.nvim", -- 自动保存
        "sbdchd/neoformat", -- 代码格式化
        "folke/which-key.nvim",
        {"lvimuser/lsp-inlayhints.nvim",opts = {}} -- neovim 0.10版本时可以删掉此行
    },

    -- event = "VeryLazy",
    config = function()
        local keymap = vim.keymap
        local wk = require("which-key")

        keymap.set("n",";","A;<esc>") -- 末尾添加分号
        keymap.set("n",",","A,<esc>") -- 末尾添加逗号

        wk.register{
            [";"] = "末尾添加分号",
            [","] = "末尾添加逗号"
        }


        require("project_nvim").setup {}
    end,
}
