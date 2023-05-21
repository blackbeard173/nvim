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

local opts = {
	ui = { border = 'rounded' },
	checker = { enabled = false },
}

require('lazy').setup('plugins', opts)

vim.cmd.colorscheme('oxocarbon')

-- keymaps
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>')
vim.keymap.set('n', '<leader>,', '<cmd>edit $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>e', vim.cmd.Lexplore)
vim.keymap.set('n', '<Leader>t<Space>', [[<CMD>%s/\s\+$//e<CR>]], {}) -- Trim trailing whitespace

-- settings
local o = vim.o
o.termguicolors = true
