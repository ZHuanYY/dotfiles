return{
    "mrcjkb/rustaceanvim",
    -- version = "^4",
    dependencies = {
        "sbdchd/neoformat",
        {"lvimuser/lsp-inlayhints.nvim",opts = {}} -- neovim 0.10版本时可以删掉此行
    },
    ft = "rust",
    keys = {
        {"<leader>lh","<cmd>RustLsp hover actions<cr>",desc="悬停窗口"},
        {"<leader>dh","<cmd>RustLsp explainError<cr>",desc="诊断悬停窗口"},
        {"<leader>oc","<cmd>RustLsp openCargo<cr>",desc="打开Cargo.toml"},
        {"<leader>od","<cmd>RustLsp openDocs<cr>",desc="打开当前符号的Docs"},
        {"<leader>lp","<cmd>RustLsp parentModule<cr>",desc="打开父模块"},
        {"<leader>ll","<cmd>RustLsp joinLines<cr>",desc="优化为一行"},
        { "<leader>ld", vim.lsp.buf.definition, desc = "跳转到定义" },
        { "<leader>lf", "<cmd>Neoformat<cr>", desc = "代码格式化" },
        { "<leader>lr", vim.lsp.buf.rename, desc = "变量重命名" },
        { "<leader>dk", vim.diagnostic.goto_prev, desc = "跳转到上个诊断" },
        { "<leader>dj", vim.diagnostic.goto_next, desc = "跳转到下个诊断" },
    },
    
    config = function()
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
