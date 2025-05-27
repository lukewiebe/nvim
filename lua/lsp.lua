-- global LSP config

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client == nil then return end

		-- disable syntax highlight, just use treesitter for that
		client.server_capabilities.semanticTokensProvider = nil
	end,
})
