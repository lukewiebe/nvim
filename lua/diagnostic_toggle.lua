-- User command to toggle diagnostics

vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local diag_disabled = vim.diagnostic.is_disabled()
	if diag_disabled then
		vim.diagnostic.enable()
		print "Diagnostics enabled"
	else
		vim.diagnostic.disable()
		print "Diagnostics disabled"
	end
end,
{ nargs = 0 })
