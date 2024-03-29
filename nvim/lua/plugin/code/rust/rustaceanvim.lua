return{
    "mrcjkb/rustaceanvim",
    -- version = "^4",
    dependencies = {
        "sbdchd/neoformat",
        "folke/which-key.nvim",
        "ahmedkhalf/project.nvim",
        {"lvimuser/lsp-inlayhints.nvim",opts = {}} -- neovim 0.10版本时可以删掉此行
    },
    ft = "rust",
    
    config = function()
        local keymap = vim.keymap
        local wk = require("which-key")
        
        keymap.set("n","<leader>lh" ,"<cmd>RustLsp hover actions<cr>" ) -- 悬停窗口
        keymap.set("n","<leader>dh" ,"<cmd>RustLsp explainError<cr>" ) -- 诊断悬停窗口
        keymap.set("n","<leader>oc" ,"<cmd>RustLsp openCargo<cr>" ) -- 打开Cargo.toml
        keymap.set("n","<leader>od" ,"<cmd>RustLsp openDocs<cr>" ) -- 打开当前符号的Docs
        keymap.set("n","<leader>lp" ,"<cmd>RustLsp parentModule<cr>" ) -- 打开父模块
        keymap.set("n","<leader>ll" ,"<cmd>RustLsp joinLines<cr>" ) -- 优化为一行
        keymap.set("n","<leader>ld" ,vim.lsp.buf.definition ) -- 跳转到定义
        keymap.set("n","<leader>lf" ,"<cmd>Neoformat<cr>" ) -- 代码格式化
        keymap.set("n","<leader>lr" ,vim.lsp.buf.rename ) -- 变量重命名
        keymap.set("n","<leader>dk" ,vim.diagnostic.goto_prev ) -- 跳转到上个诊断
        keymap.set("n","<leader>dj" ,vim.diagnostic.goto_next ) -- 跳转到下个诊断
            
        wk.register{
            ["<leader>lh"] = "悬停窗口",
            ["<leader>dh"] = "诊断悬停窗口",
            ["<leader>oc"] = "打开Cargo.toml",
            ["<leader>od"] = "打开当前符号的Docs",
            ["<leader>lp"] = "打开父模块",
            ["<leader>ll"] = "优化为一行",
            ["<leader>ld"] = "跳转到定义",
            ["<leader>lf"] = "代码格式化",
            ["<leader>lr"] = "变量重命名",
            ["<leader>dk"] = "跳转到上个诊断",
            ["<leader>dj"] = "跳转到下个诊断",
        }

        vim.g.rustaceanvim = {
            inlay_hints = {
                highlight = "NonText",
            },

            server = {
                on_attach = function(client, bufnr)
                    require("lsp-inlayhints").on_attach(client, bufnr)
                end
            }
        }
    end
}
