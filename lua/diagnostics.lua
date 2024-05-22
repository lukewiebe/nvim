-- Diagnostic configuration
-- kept independent from LSP settings because LSP is not the only way to use diagnostics

vim.diagnostic.enable(false) -- diagnostics are off by default

vim.keymap.set("n", "<leader>dd", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
	if vim.diagnostic.is_enabled() then
		print("diagnostics enabled")
	else
		print("diagnostics disabled")
	end
end, { desc = "toggle all diagnostics" })

vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "goto next diagnostic" })

vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "goto previous diagnostic" })

vim.keymap.set(
	"n",
	"<leader>do",
	function() vim.diagnostic.open_float() end,
	{ desc = "open diagnostic under the cursor in a floating window" }
)

vim.keymap.set(
	"n",
	"<leader>dq",
	function() vim.diagnostic.setqflist() end,
	{ desc = "send diagnostics to quickfix list" }
)
