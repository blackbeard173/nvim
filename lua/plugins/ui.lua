return {
    {
        'nyoom-engineering/oxocarbon.nvim',
        -- "folke/tokyonight.nvim",
        config = function()
            vim.cmd([[colorscheme oxocarbon]])
        end
    },
    {
        'akinsho/bufferline.nvim',
        version = "v3.*",
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require("bufferline").setup {}
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim', 'rebelot/kanagawa.nvim',
        },
        config = true,
    }
}
