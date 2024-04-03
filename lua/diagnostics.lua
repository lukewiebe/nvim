-- Diagnostic configuration
-- kept independent from LSP settings because LSP is not the only way to use diagnostics

vim.diagnostic.disable() -- diagnostics are off by default

vim.keymap.set("n", "<leader>dd", function()
	if vim.diagnostic.is_disabled() then
		vim.diagnostic.enable()
		print("Diagnostics enabled")
	else
		vim.diagnostic.disable()
		print("Diagnostics disabled")
	end
end, { desc = "toggle all diagnostics" })

vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next()
end, { desc = "goto next diagnostic" })

vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev()
end, { desc = "goto previous diagnostic" })

vim.keymap.set("n", "<leader>do", function()
	vim.diagnostic.open_float()
end, { desc = "open diagnostic under the cursor in a floating window" })

vim.keymap.set("n", "<leader>dq", function()
	vim.diagnostic.setqflist()
end, { desc = "send diagnostics to quickfix list" })
