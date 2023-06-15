return {
	{
		'williamboman/mason.nvim',
		cmd = 'Mason',
		opts = {
			ui = {
				border = 'rounded',
				icons = { package_installed = '✓', package_pending = '➜', package_uninstalled = '✗' },
			},
		},
	},
	{
		'williamboman/mason-lspconfig.nvim',
		opts = {
			ensure_installed = require('utils').servers,
			automatic_installation = true,
		},
	},
}
