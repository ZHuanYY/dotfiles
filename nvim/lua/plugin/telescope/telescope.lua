return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    keys = {
        { "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "find files" },
        { "<leader>tg", "<cmd>Telescope live_grep<cr>",  desc = "live grep" },
        { "<leader>tb", "<cmd>Telescope buffers<cr>",    desc = "find buffwrs" },
        { "<leader>th", "<cmd>Telescope help_tags<cr>",  desc = "help tags" },
    },

    opts = true,
}
