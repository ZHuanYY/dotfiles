return {
    name = "lua_lsp",
    dir = "",
    dependencies = {
        "neovim/nvim-lspconfig",
        "ahmedkhalf/project.nvim"
    },
    ft = "lua",
    config = function()
        -- lsp服务器下载
        require("mason-lspconfig").setup {
            ensure_installed = { "lua_ls" },
        }

        -- lsp服务器配置
        local lspconfig = require("lspconfig")
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        lspconfig.lua_ls.setup {
            capabilities = capabilities,
        }

        -- 快捷键绑定
        local wk = require("which-key")
        local keymap = vim.keymap
        local lsp = vim.lsp
        local diagnostic = vim.diagnostic

        keymap.set("n", "<leader>lh", lsp.buf.hover)         -- 悬停窗口
        keymap.set("n", "<leader>dh", diagnostic.open_float) -- 诊断悬停窗口
        keymap.set("n", "<leader>ld", lsp.buf.definition)    -- 跳转到定义
        keymap.set("n", "<leader>lr", lsp.buf.rename)        -- 变量重命名
        keymap.set("n", "<leader>dk", diagnostic.goto_prev)  -- 跳转到上个诊断
        keymap.set("n", "<leader>dj", diagnostic.goto_next)  -- 跳转到下个诊断
        keymap.set("n", "<leader>lf", lsp.buf.format)        -- 代码格式化
        keymap.set("n", "<leader>lc", lsp.buf.code_action)   -- 代码操作

        wk.register {
            ["<leader>lh"] = "悬停窗口",
            ["<leader>dh"] = "诊断悬停窗口",
            ["<leader>ld"] = "跳转到定义",
            ["<leader>lr"] = "变量重命名",
            ["<leader>dk"] = "跳转到上个诊断",
            ["<leader>dj"] = "跳转到下个诊断",
            ["<leader>lf"] = "代码格式化",
            ["<leader>lc"] = "代码操作",
        }
    end,
}
