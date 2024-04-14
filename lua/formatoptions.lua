-- autocmd to disable comment on new line

vim.api.nvim_create_autocmd("BufEnter", {
	-- for groups clear is the default, shown here for clarity
	group = vim.api.nvim_create_augroup("FormatOptions", { clear = true }),
	pattern = "*",
	callback = function()
		vim.cmd.set("formatoptions-=o") -- no comment on o and O
	end,
})

-- hello
