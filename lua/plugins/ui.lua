return {
    {

        "folke/tokyonight.nvim",
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end
    },
    -- 'nyoom-engineering/oxocarbon.nvim',

    {
        'akinsho/bufferline.nvim',
        version = "v3.*",
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require("bufferline").setup {}
        end
    }
}
