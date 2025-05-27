-- Diagnostic configuration

vim.diagnostic.enable(false) -- diagnostics off by default

vim.keymap.set("n", "<leader>dd", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
	if vim.diagnostic.is_enabled() then
		print("diagnostics enabled")
	else
		print("diagnostics disabled")
	end
end, { desc = "toggle all diagnostics" })

vim.keymap.set(
	"n",
	"<leader>dq",
	function() vim.diagnostic.setqflist() end,
	{ desc = "send diagnostics to quickfix list" }
)

-- enable virtual text
vim.diagnostic.config({
	virtual_lines = {
		current_line = true, -- only show on current line
	},
})
