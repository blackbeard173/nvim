vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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
  { 'folke/tokyonight.nvim' },
  { 'nyoom-engineering/oxocarbon.nvim' },

  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, cmd = 'Telescope' },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = { auto_install = true, highlight = { enable = true }, indent = { enable = true } },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },

  {
    'echasnovski/mini.statusline',
    config = function(_, opts)
      require('mini.statusline').setup(opts)
    end,
  },
  {
    'echasnovski/mini.comment',
    keys = { 'gc', 'gcc' },
    config = function(_, opts)
      require('mini.comment').setup(opts)
    end,
  },
  {
    'echasnovski/mini.indentscope',
    opts = { symbol = '│' },
    config = function(_, opts)
      require('mini.indentscope').setup(opts)
    end,
  },
  {
    'echasnovski/mini.pairs',
    config = function(_, opts)
      require('mini.pairs').setup(opts)
    end,
  },
  {
    'echasnovski/mini.basics',
    opts = {
      basic = true,
      extra_ui = true,
      win_borders = 'rounded',
    },
    config = function(_, opts)
      require('mini.basics').setup(opts)
    end,
  },
}

local opts = {
  ui = { border = 'rounded' },
  checker = { enabled = true },
}

require('lazy').setup(plugins, opts)

vim.cmd.colorscheme('tokyonight-night')

-- keymaps
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>')
vim.keymap.set('n', '<leader>,', '<cmd>e $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>e', vim.cmd.Lexplore)

-- settings
local o = vim.o
o.termguicolors = true
