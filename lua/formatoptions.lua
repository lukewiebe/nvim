-- autocmd to disable comment on new line

vim.api.nvim_create_autocmd("BufEnter", {
	-- for groups clear is the default, shown here for clarity
	group = vim.api.nvim_create_augroup("FormatOpts", { clear = true }),
	pattern = "*",
	callback = function()
		vim.cmd.set("formatoptions-=o")
	end,
})

-- hello
