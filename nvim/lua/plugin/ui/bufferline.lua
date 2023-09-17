-- 标签栏

return {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
    keys = {
        { "<C-h>",  "<cmd>BufferLineCyclePrev<cr>",   desc = "切换到上一标签页" },
        { "<C-l>",  "<cmd>BufferLineCycleNext<cr>",   desc = "切换到下一标签页" },
        { "<leader>bmh", "<cmd>BufferLineMovePrev<cr>",    desc = "标签页前移" },
        { "<leader>bml", "<cmd>BufferLineMoveNext<cr>",    desc = "标签页后移" },
        { "<leader>bp",  "<cmd>BufferLinePick<cr>",        desc = "选择标签页" },
        { "<leader>bcp", "<cmd>BufferLinePickClose<cr>",   desc = "选择关闭标签页" },
        { "<leader>bco", "<cmd>BufferLineCloseOthers<cr>", desc = "关闭其他标签页" },
        { "<leader>bd", "<cmd>bd<cr>",desc = "关闭当前buffer"}
    },
    config = function()
        vim.cmd(string.format("colorscheme %s", theme)) -- 设置主题
        require("bufferline").setup{}
    end,
}
