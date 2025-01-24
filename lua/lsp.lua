-- Global LSP Configuration --

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
	callback = function(args)
		-- Buffer local mappings
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client == nil then return end
		if client.server_capabilities.hoverProvider then
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
		end
		if client.server_capabilities.codeActionsProvider then
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action(), { buffer = args.buf })
		end
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = args.buf })
		vim.keymap.set("n", "<leader>s", vim.lsp.buf.rename, { buffer = args.buf })
		vim.keymap.set("n", "grr", vim.lsp.buf.references, { buffer = args.buf })

		-- disable syntax highlight, just use treesitter for that
		client.server_capabilities.semanticTokensProvider = nil
	end,
})
