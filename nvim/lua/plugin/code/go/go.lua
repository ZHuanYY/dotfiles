return {
    "ray-x/go.nvim",
    dependencies = {
        "ray-x/guihua.lua",
        "ahmedkhalf/project.nvim",
        "neovim/nvim-lspconfig",
    },
    build = ':lua require("go.install").update_all_sync()',
    ft = { "go", "gomod" },

    config = function()
        require("go").setup()

        -- lsp服务器配置
        local lspconfig = require("lspconfig")
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local util = require("lspconfig/util")

        lspconfig.gopls.setup {
            capabilities = capabilities,
            filetypes = { "go", "gomod" },
            root_dir = util.root_pattern("go.mod", ".git"),
            inlay_hints = { enabled = true },
            settings = {
                gopls = {
                    completeUnimported = true, -- 自动导入包
                    usePlaceholders = true,    -- 自动添加参数名
                    analyses = {
                        unusedparams = true    -- 存在未使用参数时，产生warning提示
                    }
                }
            }
        }


        -- 快捷键绑定
        local wk = require("which-key")
        local keymap = vim.keymap
        local lsp = vim.lsp
        local diagnostic = vim.diagnostic

        keymap.set("n", "<leader>lh", lsp.buf.hover)                -- 悬停窗口
        keymap.set("n", "<leader>dh", diagnostic.open_float)        -- 诊断悬停窗口
        keymap.set("n", "<leader>ld", lsp.buf.definition)           -- 跳转到定义
        keymap.set("n", "<leader>lr", lsp.buf.rename)               -- 变量重命名
        keymap.set("n", "<leader>dk", diagnostic.goto_prev)         -- 跳转到上个诊断
        keymap.set("n", "<leader>dj", diagnostic.goto_next)         -- 跳转到下个诊断
        keymap.set("n", "<leader>lf", require("go.format").goimports) -- 代码格式化
        keymap.set("n", "<leader>lc", lsp.buf.code_action)          -- 代码操作

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
    end

}
