return {
    "nvimdev/lspsaga.nvim",
    dependencies = "neovim/nvim-lspconfig",
    keys = {
        { "<leader>lr", "<cmd>Lspsaga rename<cr>", desc = "变量重命名" },
        { "<leader>lc", "<cmd>Lspsaga code_action<cr>", desc = "代码操作" },
        { "<leader>lh", "<cmd>Lspsaga hover_doc<cr>", desc = "lsp悬停窗口" },
        { "<leader>so", "<cmd>Lspsaga outline<cr>", desc = "代码大纲" },
        { "<leader>dk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "跳转到上个诊断" },
        { "<leader>dj", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "跳转到下个诊断" },
        { "<leader>dh", "<cmd>Lspsaga show_cursor_diagnostics<cr>", desc = "诊断悬停窗口" },
    },
    opts = true,
}
