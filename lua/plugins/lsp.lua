vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc' -- Enable completion triggered by <c-x><c-o>

		-- Buffer local mappings. See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

-- Enable formatting on save
vim.cmd([[
augroup FormatOnSave
	autocmd!
  	autocmd BufWritePre * lua vim.lsp.buf.format({async = true})
augroup END
]])

return {
	{
		'williamboman/mason.nvim',
		opts = {
			ui = {
				border = 'rounded',
				icons = { package_installed = '✓', package_pending = '➜', package_uninstalled = '✗' },
			},
		},
	},
	{
		'williamboman/mason-lspconfig.nvim',
		opts = { ensure_installed = { 'lua_ls', 'tsserver' } },
		config = function(_, opts)
			require('mason-lspconfig').setup(opts)
			require('mason-lspconfig').setup_handlers({
				function(server_name)
					require('lspconfig')[server_name].setup({})
				end,
				['lua_ls'] = function() -- handler override for the `lua_ls`:
					require('lspconfig').lua_ls.setup({
						settings = {
							Lua = {
								runtime = { version = 'LuaJIT' },
								diagnostics = { globals = { 'vim' } },
								telemetry = { enable = false },
							},
						},
					})
				end,
			})
		end,
	},
	{ 'neovim/nvim-lspconfig' },
	{ 'echasnovski/mini.completion', config = true },
	{
		'jose-elias-alvarez/null-ls.nvim',
		config = function()
			local null_ls = require('null-ls')
			local formatting = null_ls.builtins.formatting
			local sources = { formatting.stylua, formatting.prettier }
			local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
			null_ls.setup({
				sources = sources,
				on_attach = function(client, bufnr)
					if client.supports_method('textDocument/formatting') then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd('BufWritePre', {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			})
		end,
	},
}
