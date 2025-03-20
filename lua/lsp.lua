-- global LSP config

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
	callback = function(args)
		-- Buffer local mappings
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client == nil then return end

		if client.server_capabilities.hoverProvider then
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
		end
		if client.server_capabilities.codeActionProvider then
			vim.keymap.set({"n", "v"}, "gra", vim.lsp.buf.code_action, { buffer = args.buf })
		end
		vim.keymap.set({"i", "s"}, "<C-S>", vim.lsp.buf.signature_help, { buffer = args.buf })
		vim.keymap.set("n", "grn", vim.lsp.buf.rename, { buffer = args.buf })
		vim.keymap.set("n", "grr", vim.lsp.buf.references, { buffer = args.buf })
		vim.keymap.set("n", "gri", vim.lsp.buf.implementation, { buffer = args.buf })

		-- disable syntax highlight, just use treesitter for that
		client.server_capabilities.semanticTokensProvider = nil
	end,
})
