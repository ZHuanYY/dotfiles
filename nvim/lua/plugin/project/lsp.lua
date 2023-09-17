return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "nvim-treesitter/nvim-treesitter",
        "hrsh7th/nvim-cmp",
    },
    ft = { "rust", "lua", "c", "json", "toml" },
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
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        lsp.lua_ls.setup {
            capabilities = capabilities,
        }
        lsp.rust_analyzer.setup {
            capabilities = capabilities,
        }
        lsp.clangd.setup {
            capabilities = capabilities,
        }
        lsp.cmake.setup {
            capabilities = capabilities,
        }
        lsp.glslls.setup {
            capabilities = capabilities,
        }
        lsp.jsonls.setup {
            capabilities = capabilities,
        }

        -- 保存时代码自动格式化
        vim.cmd [[
            augroup code_save_auto_format
                autocmd!
                autocmd BufWritePre * :lua vim.lsp.buf.format()
            augroup end
        ]]

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
