return {
	{ 'nvim-lua/plenary.nvim', lazy = true },
	{ 'nvim-tree/nvim-web-devicons', lazy = true },
	{
		'dstein64/vim-startuptime',
		cmd = 'StartupTime',
		config = function()
			vim.g.startuptime_tries = 30
		end,
	},
}
