-- equalize window size when vim is resized

vim.api.nvim_create_autocmd("VimResized", {
	callback = function()
		vim.cmd.wincmd("=")
	end,
	group = vim.api.nvim_create_augroup("Resize", { clear = false }),
})
