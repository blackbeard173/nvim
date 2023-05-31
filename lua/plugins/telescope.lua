return {
	{
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		keys = {
			{ '<leader>p', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
			{ '<leader>tg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
		},
	},
}
