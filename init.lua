vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    -- 'nvim-treesitter/nvim-treesitter-context', -- Fixme: not working
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },
    'nvim-telescope/telescope-file-browser.nvim',
    -- 	colorschemes
    'folke/tokyonight.nvim',
    -- 'nyoom-engineering/oxocarbon.nvim',
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    {
        "folke/twilight.nvim",
        cmd = "Twilight",
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional
            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        },
    },
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
    },
    'numToStr/Comment.nvim',
    'Exafunction/codeium.vim',
})

require("user.options")
require("user.keymaps")
require("user.colors")
-- plugins
require("user.plugins.alpha")
require("user.plugins.comment")
require("user.plugins.lsp")
require("user.plugins.telescope")
require("user.plugins.treesitter")
require("user.plugins.twilight")
