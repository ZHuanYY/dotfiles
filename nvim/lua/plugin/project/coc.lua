local show_docs = function()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

return {
    "neoclide/coc.nvim",
    branch = "release",
    -- dependencies = {
    --     "nvim-treesitter/nvim-treesitter"
    -- },
    enabled = false;
    ft = { "rust", "lua", "c", "json", "toml", "cmake" },
    keys = {
        { "<tab>", "coc#pum#visible() ? coc#pum#next(1) : '<TAB>'", mode = "i", expr = true },
        { "<S-TAB>", "coc#pum#visible() ? coc#pum#prev(1) : '<S-TAB>'", mode = "i", expr = true },
        { "<cr>", "coc#pum#visible() ? coc#pum#confirm() : '<CR>'", mode = "i", expr = true },
        { "<c-space>", "coc#refresh()", mode = "i", expr = true },
        { "<leader>ld", "<Plug>(coc-definition)", desc = "跳转到定义" },
        { "<leader>lf", "<Plug>(coc-format)", desc = "代码格式化" },
        { "<leader>lc", "<Plug>(coc-codeaction-cursor)", desc = "代码操作" },
        { "<leader>lh", show_docs, desc = "悬停窗口" },
        { "<leader>lr", "<Plug>(coc-rename)", desc = "变量重命名" },
        { "<leader>dk", "<Plug>(coc-diagnostic-prev)", desc = "跳转到上个诊断" },
        { "<leader>dj", "<Plug>(coc-diagnostic-next)", desc = "跳转到下个诊断" },
        { "<leader>dl", ":<C-u>CocList diagnostics<cr>", desc = "诊断列表" },
    },
    config = function()
        vim.g.coc_global_extensions = {
            "coc-marketplace",
            "coc-lua",
            "coc-json",
            "coc-rust-analyzer",
            "coc-clangd"
        }
    end,
}
