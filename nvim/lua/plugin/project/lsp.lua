return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "nvim-treesitter/nvim-treesitter",
        "simrat39/rust-tools.nvim",
    },
    event = "BufReadPre",
    keys = {
        { "<leader>ld", vim.lsp.buf.definition, desc = "跳转到定义" },
        { "<leader>lf", vim.lsp.buf.format, desc = "代码格式化" },
    },
    config = function()
        require("mason").setup {}
        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "clangd",
                "cmake",
            }
        }

        local lsp = require("lspconfig")
        lsp.lua_ls.setup {}
        lsp.rust_analyzer.setup {}
        lsp.clangd.setup {}
        lsp.cmake.setup {}
        lsp.glslls.setup {}
        lsp.jsonls.setup {}

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
