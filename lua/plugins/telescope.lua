return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		cmd = 'Telescope',
		keys = {
			{ '<leader>p', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
		},
	},
}
