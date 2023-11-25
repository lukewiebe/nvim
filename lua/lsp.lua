-- Global LSP Configuration --

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(args)
		-- enable LSP omnifunc
		vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client.server_capabilities.hoverProvider then
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
		end
		-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = args.buf })
		-- gd provided by treesitter with LSP fallback
		-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })
		vim.keymap.set("n", "<space>gi", vim.lsp.buf.implementation, { buffer = args.buf })
		-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = args.buf })
		vim.keymap.set("n", "<leader>s", vim.lsp.buf.rename, { buffer = args.buf })
		vim.keymap.set("n", "<space>gr", vim.lsp.buf.references, { buffer = args.buf })

		-- disable syntax highlight, just use treesitter for that
		client.server_capabilities.semanticTokensProvider = nil
	end,
})
