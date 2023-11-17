-- User command to toggle diagnostics

vim.keymap.set("n", "<leader>d", function()
	local diag_disabled = vim.diagnostic.is_disabled()
	if diag_disabled then
		vim.diagnostic.enable()
		print("Diagnostics enabled")
	else
		vim.diagnostic.disable()
		print("Diagnostics disabled")
	end
end)
