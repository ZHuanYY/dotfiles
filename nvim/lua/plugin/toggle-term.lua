-- 内置终端
return {
    "akinsho/toggleterm.nvim",
    keys = {
        {"<f8>", "<cmd>ToggleTerm direction=float<cr>",mode = {"n","t"}, desc = "开关终端"}
    },
    config = function()
        require("toggleterm").setup{}
    end,
}
