vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- basics
	-- 	treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
	},
	-- 'nvim-treesitter/nvim-treesitter-context', -- Fixme: not working

	-- ui
	-- 	colorschemes
	'folke/tokyonight.nvim',
	-- 'nyoom-engineering/oxocarbon.nvim',
	--	dashboard
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},
	{
		"folke/twilight.nvim",
		cmd = "Twilight",
	},


	-- performance
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
	},
})

require("user.options")
require("user.keymaps")
require("user.colors")
-- plugins
require("user.plugins.alpha")
require("user.plugins.treesitter")
require("user.plugins.twilight")
