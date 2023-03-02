return {
    {
        "folke/tokyonight.nvim",
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end
    },
    {
        'nyoom-engineering/oxocarbon.nvim',
        lazy = true,
    },
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
    },
}
