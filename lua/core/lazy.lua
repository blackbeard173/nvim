local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('plugins.nvim-treesitter')
    end,
  },
  -- [[ui]]
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = false,
    config = function()
      vim.cmd.colorscheme('catppuccin')
    end,
  },
  {
    'olivercederborg/poimandres.nvim',
    enabled = false,
    config = function()
      vim.cmd.colorscheme('poimandres')
    end,
  },
  {
    'folke/tokyonight.nvim',
    enabled = true,
    config = function()
      vim.cmd.colorscheme('tokyonight')
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    enabled = false,
    config = function()
      vim.cmd.colorscheme('rose-pine')
    end,
  },
  { 'echasnovski/mini.statusline', config = true },
  { 'echasnovski/mini.tabline', config = true },
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  -- [[formatting]]
  {
    'mhartington/formatter.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('plugins.formatter')
    end,
  },
  -- [[lsp]]
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
    },
    config = function()
      require('plugins.lsp-zero')
    end,
  },
  -- [[ explorer ]]
  {
    'stevearc/oil.nvim',
    config = true,
    keys = { { '<leader>-', '<cmd>Oil<cr>', desc = 'Open parent directory' } },
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    cmd = 'Telescope',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' },
    keys = {
      { '<leader>p', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
      { '<leader>tg', '<cmd>Telescope live_grep<cr>', desc = 'live grep' },
    },
    config = function()
      require('plugins.telescope')
    end,
  },
  -- [[ qol ]]
  { 'echasnovski/mini.comment', event = { 'BufReadPost', 'BufNewFile' }, config = true },
  { 'echasnovski/mini.completion', event = { 'BufReadPost', 'BufNewFile' }, config = true, enabled = false },
  { 'echasnovski/mini.indentscope', event = { 'BufReadPost', 'BufNewFile' }, opts = { symbol = '│' } },
  { 'echasnovski/mini.move', event = { 'BufReadPost', 'BufNewFile' }, config = true },
  { 'echasnovski/mini.pairs', event = { 'BufReadPost', 'BufNewFile' }, config = true },
  { 'echasnovski/mini.surround', event = { 'BufReadPost', 'BufNewFile' }, config = true },
  { 'echasnovski/mini.trailspace', event = { 'BufReadPost', 'BufNewFile' }, config = true },
}

require('lazy').setup(plugins)
