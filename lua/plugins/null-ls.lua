return {
	{
		'jose-elias-alvarez/null-ls.nvim',
		config = function()
			local null_ls = require('null-ls')
			local formatting = null_ls.builtins.formatting
			local sources = {
				formatting.stylua,
				formatting.prettier,
			}
			local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
			null_ls.setup({
				sources = sources,
				on_attach = function(client, bufnr)
					if client.supports_method('textDocument/formatting') then
						vim.api.nvim_clear_autocmds({
							group = augroup,
							buffer = bufnr,
						})
						vim.api.nvim_create_autocmd('BufWritePre', {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									bufnr = bufnr,
									filter = function(client)
										return client.name == 'null-ls'
									end,
								})
							end,
						})
					end
				end,
			})
		end,
	},
}
