return {
	{ 'folke/tokyonight.nvim', lazy = true },
	{ 'nyoom-engineering/oxocarbon.nvim', lazy = true },
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		lazy = false,
		config = function()
			vim.cmd.colorscheme('catppuccin')
		end,
	},
}
