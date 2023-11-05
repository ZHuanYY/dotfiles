return {
    "neovim/nvim-lspconfig",
    enabled = true,
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "nvim-treesitter/nvim-treesitter",
        "hrsh7th/nvim-cmp",
        { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
        "sbdchd/neoformat",
    },
    ft = { "rust", "lua", "c", "json", "toml", "cmake" },
    keys = {
        { "<leader>ld", vim.lsp.buf.definition, desc = "跳转到定义" },
        { "<leader>lf", "<cmd>Neoformat<cr>", desc = "代码格式化" },
        -- { "<leader>lf", vim.lsp.buf.format, desc = "代码格式化" },
        { "<leader>lc", vim.lsp.buf.code_action, desc = "代码操作" },
        { "<leader>lh", vim.lsp.buf.hover, desc = "悬停窗口" },
        { "<leader>lr", vim.lsp.buf.rename, desc = "变量重命名" },
        { "<leader>dk", vim.diagnostic.goto_prev, desc = "跳转到上个诊断" },
        { "<leader>dj", vim.diagnostic.goto_next, desc = "跳转到下个诊断" },
        { "<leader>dh", vim.diagnostic.open_float, desc = "诊断悬停窗口" },
    },
    config = function()
        vim.g.c_syntax_for_h=1

        require("mason").setup {}
        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "clangd",
                "neocmake",
                "jsonls",
            }
        }

        -- 格式化样式
        vim.g.neoformat_c_clangformat = {
            exe = "clang-format",
            args = { [[--style="{BasedOnStyle: llvm, IndentWidth: 4}"]] }
        }
        vim.g.neoformat_enabled_c = { "clangformat" }

        local lsp = require("lspconfig")
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        lsp.lua_ls.setup {
            capabilities = capabilities,
        }
        lsp.rust_analyzer.setup {
            capabilities = capabilities,
        }

        lsp.neocmake.setup {
            capabilities = capabilities,
        }
        lsp.glslls.setup {
            capabilities = capabilities,
        }
        lsp.jsonls.setup {
            capabilities = capabilities,
        }
        lsp.clangd.setup {
            capabilities = capabilities,
        }


        -- 保存时代码自动格式化
        -- vim.cmd [[
        --     augroup code_save_auto_format
        --     autocmd!
        --     autocmd BufWritePre * :lua vim.lsp.buf.format()
        --     augroup end ]]

        -- lsp ui 样式
        local border = "single"
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, {
                border = border
            }
        )
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help, {
                border = border
            }
        )
        vim.diagnostic.config {
            float = { border = border }
        }
        require('lspconfig.ui.windows').default_options = {
            border = border
        }
    end,
}
