 return{
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "ahmedkhalf/project.nvim"
    },
    config = function()
        require("mason").setup{}
    end,
}
