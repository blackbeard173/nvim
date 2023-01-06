local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
        vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
    end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- ui
    -- 'nyoom-engineering/oxocarbon.nvim',
    'sam4llis/nvim-tundra',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', },
    },
    -- {
    --     'gen740/SmoothCursor.nvim',
    --     config = function()
    --         require('smoothcursor').setup()
    --     end,
    -- },

    -- telescope
    {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
        },
    },

    -- performance
    {
        'dstein64/vim-startuptime',
        cmd = "StartupTime",
    },
    -- { 'lewis6991/impatient.nvim' },

    -- treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', },

    --
    -- { 'theprimeagen/harpoon' },
    -- { 'mbbill/undotree' },
    -- { 'tpope/vim-fugitive' },

    -- lsp
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        },
    },

    -- comments
    { 'numToStr/Comment.nvim', },
})
