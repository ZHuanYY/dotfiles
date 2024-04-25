-- 快捷键提示
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    config = function()
        vim.g.mapleader = " " -- 设置主键     ■ Undefined global `vim`.
        local keymap = vim.keymap

        keymap.set("n", "<leader>nh", ":nohl<CR>") -- 取消高亮
        keymap.set("n", "<c-j>", "o<esc>k")        -- 下方插入一行
        keymap.set("n", "<c-k>", "o<esc>j")        -- 上方插入一行
        keymap.set("n", "<tab>", "I<tab><esc>")    -- 增加缩进
        keymap.set("n", "<S-Tab>", "I<bs><esc>")     -- 减少缩进

        local wk = require("which-key")
        wk.setup()
        wk.register {
            ["<leader>nh"] = "取消高亮",
            ["<c-j>"] = "下方插入一行",
            ["<c-k>"] = "上方插入一行",
            ["<tab>"] = "增加缩进",
            ["<S-Tab>"] = "减少缩进",
        }
    end
}
